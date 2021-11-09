{
  description = "Markdown template";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      rBaseInputs = with pkgs; [
        R
        rPackages.tidyverse
        rPackages.zoo
        rPackages.reshape2
      ];

      rmdInputs = with pkgs; [
        rstudio
        pandoc
        rPackages.rmarkdown
        rPackages.markdown
        rPackages.knitr
        rPackages.magick
        rPackages.codetools
        texlive.combined.scheme-full
      ];

      buildInputs = rBaseInputs ++ rmdInputs;

      generateDerivations =
        { path, commonDer, buildInputs ? [ ], extension, outputFormats }:
        let names = getFiles { inherit path extension; };

        in builtins.listToAttrs (builtins.concatMap (name:
          let basename = builtins.elemAt (builtins.split extension name) 0;
          in (builtins.map (outputFormat: {
            name = "${basename}::${outputFormat}";
            value = commonDer {
              inherit basename extension buildInputs outputFormat;
            };
          }) outputFormats)) names);

      hasExtension = name: extension:
        builtins.length (builtins.split extension name) != 1;

      getFiles = { path, extension }:
        let dir = builtins.readDir path;
        in builtins.filter (name:
          let type = builtins.getAttr name dir;
          in type == "regular"
          && hasExtension (builtins.baseNameOf name) extension)
        (builtins.attrNames dir);

      multiDer = { basename, extension, outputFormats, buildInputs ? [ ] }:
        builtins.listToAttrs ((builtins.map (outputFormat: {
          name = "${outputFormat}";
          value =
            commonDer { inherit basename extension buildInputs outputFormat; };
        }) outputFormats));

      commonDer = { basename, extension, outputFormat, buildInputs ? [ ] }:
        with pkgs;
        stdenv.mkDerivation {
          name = basename;
          buildInputs = buildInputs;
          src = ./.;
          installPhase = ''
            Rscript -e 'rmarkdown::render("${basename}.Rmd", "${outputFormat}_document")'
            mv ${basename}.${outputFormat} $out
          '';
        };
    in {
      devShell.x86_64-linux = pkgs.mkShell { inherit buildInputs; };

      packages.x86_64-linux = generateDerivations {
        path = ./.;
        inherit commonDer buildInputs;
        extension = ".Rmd";
        outputFormats = [ "html" "pdf" ];
      };
    };
}

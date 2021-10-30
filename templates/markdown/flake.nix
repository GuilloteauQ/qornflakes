{
  description = "Markdown template";

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };

	buildInputs = with pkgs; [
		pandoc
		texlive.combined.scheme-medium
	];

    generateDerivations = { path, commonDer, buildInputs ? [ ], extension }:
      let names = getFiles { inherit path extension; };
      in (builtins.listToAttrs ((builtins.map (name:
        let basename = builtins.elemAt (builtins.split extension name) 0;
        in {
          name = basename;
          value = commonDer { inherit basename extension buildInputs; };
        })) names));

    hasExtension = name: extension:
      builtins.length (builtins.split extension name) != 1;

    getFiles = { path, extension }:
      let dir = builtins.readDir path;
      in builtins.filter (name:
        let type = builtins.getAttr name dir;
        in type == "regular"
        && hasExtension (builtins.baseNameOf name) extension)
      (builtins.attrNames dir);

    commonDer = { basename, extension, buildInputs ? [ ] }:
      with pkgs;
      stdenv.mkDerivation {
        name = basename;
        buildInputs = buildInputs;
        src = ./.;
        installPhase = ''
          pandoc ${basename}.md -o ${basename}.pdf
          mv ${basename}.pdf $out
        '';
      };
  in
  {
      devShell.x86_64-linux = pkgs.mkShell { inherit buildInputs; };

      packages.x86_64-linux = generateDerivations {
        path = ./.;
        inherit commonDer buildInputs;
        extension = ".md";
      };
  };
}

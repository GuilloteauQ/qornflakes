{
  description = "Markdown template";

  inputs = {
    qorn = {
      url = "github:GuilloteauQ/qornflakes";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, qorn }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      rPkgs = with pkgs.rPackages; [
        tidyverse
        zoo
        reshape2
        rmarkdown
        markdown
        knitr
        magick
        codetools
        qorn.packages.x86_64-linux.qprez
      ];

      myRStudio = pkgs.rstudioWrapper.override { packages = rPkgs; };
      myR = pkgs.rWrapper.override { packages = rPkgs; };

      buildInputs = with pkgs; [ myR pandoc texlive.combined.scheme-full ];

    in {
      devShell.x86_64-linux =
        pkgs.mkShell { buildInputs = buildInputs ++ [ myRStudio ]; };

      defaultPackage.x86_64-linux = self.packages.x86_64-linux.slides;

      packages.x86_64-linux.slides = with pkgs;
        stdenv.mkDerivation {
          name = "slides";
          inherit buildInputs;
          src = ./.;
          installPhase = ''
            make slides.pdf
            mkdir -p $out
            mv slides/main.pdf $out/
          '';
        };
    };
}

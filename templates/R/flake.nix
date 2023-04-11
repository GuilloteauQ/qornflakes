{
  description = "R with tidyverse and friends";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.11";
  };


  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      rBaseInputs = with pkgs; [
        R
        rPackages.tidyverse
      ];

      rmdInputs = with pkgs; [
        pandoc
        rPackages.rmarkdown
        rPackages.markdown
        rPackages.knitr
        texlive.combined.scheme-full
      ];
    in
    {

      devShells.${system} = rec {
        default = rshell;
        rshell =
          pkgs.mkShell { buildInputs = rBaseInputs; };

        rmdshell =
          pkgs.mkShell { buildInputs = rBaseInputs ++ rmdInputs; };
      };
    };
}

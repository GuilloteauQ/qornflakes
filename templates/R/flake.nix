{
  description = "R with tidyverse and friends";

  outputs = { nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };

      rBaseInputs = with pkgs; [
        R
        rPackages.tidyverse
        rPackages.zoo
        rPackages.reshape2
      ];

      rmdInputs = with pkgs; [
        pandoc
        rPackages.rmarkdown
        rPackages.markdown
        rPackages.knitr
        texlive.combined.scheme-full
      ];
    in {

      devShell.x86_64-linux =
        pkgs.mkShell { buildInputs = rBaseInputs ++ rmdInputs; };
    };
}

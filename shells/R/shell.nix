{ pkgs }:
let
  utils = import ../utils.nix;
  name = "R";
    buildInputs = with pkgs; [
      R
      rPackages.tidyverse
      rPackages.zoo
      rPackages.reshape2
    ];
in
  utils.getShell { inherit pkgs name buildInputs; }

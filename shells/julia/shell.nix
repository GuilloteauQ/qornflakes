{ pkgs }:
let
  utils = import ../utils.nix;
  name = "julia";
    buildInputs = with pkgs; [
      julia-stable-bin
    ];
in
  utils.getShell { inherit pkgs name buildInputs; }

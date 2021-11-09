{ pkgs }:
let
  utils = import ../utils.nix;
  name = "lua";
    buildInputs = with pkgs; [
     lua5_4
    ];
in
  utils.getShell { inherit pkgs name buildInputs; }

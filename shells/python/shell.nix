{ pkgs }:
let
  utils = import ../utils.nix;
  name = "python";
  buildInputs = with pkgs; [ python38Full ];
in utils.getShell { inherit pkgs name buildInputs; }

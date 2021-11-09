{ pkgs }:
let
  getFolders = { path }:
    let dir = builtins.readDir path;
    in builtins.filter
    (name: let type = builtins.getAttr name dir; in type == "directory")
    (builtins.attrNames dir);

  buildSet = { pkgs, path }:
    let folders = getFolders { inherit path; };
    in builtins.listToAttrs (builtins.map (folder_name: {
      name = "shell-${folder_name}";
      value =
        import (./. + "/${folder_name}/shell.nix") { inherit pkgs; };
    }) folders);

    path = ./.;
in buildSet { inherit pkgs path; }

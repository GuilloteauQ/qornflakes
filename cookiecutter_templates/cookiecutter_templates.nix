let
  getFolders = { path }:
    let dir = builtins.readDir path;
    in builtins.filter
    (name: let type = builtins.getAttr name dir; in type == "directory")
    (builtins.attrNames dir);

  buildSet = { path }:
    let folders = getFolders { inherit path; };
    in builtins.listToAttrs (builtins.map (folder_name: {
      name = "cc-${folder_name}";
      value = {
        path = "${path}/${folder_name}";
        description = "cookiecutter-template-${folder_name}";
      };
    }) folders);
in buildSet { path = ./.; }

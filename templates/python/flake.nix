{
  description = "a Python3 flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/22.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system} = rec {
        default = my_python_app;
        my_python_app = with pkgs;
          python3Packages.buildPythonPackage rec {
            name = "my_python_app";
            version = "0.1";
            src = ./.;
            propagatedBuildInputs = with python3Packages;
              [
                # requests
              ];
            doCheck = false;
          };
      };
    };
}

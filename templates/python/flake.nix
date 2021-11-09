{
  description = "a Python38 flake";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      packages.x86_64-linux.my_python_app = with pkgs;
        python38Packages.buildPythonPackage rec {
          name = "my_python_app";
          version = "0.1";
          src = ./.;
          propagatedBuildInputs = with python38Packages;
            [
              # requests
            ];
          doCheck = false;
        };

      defaultPackage.x86_64-linux = self.packages.x86_64-linux.my_python_app;
    };
}

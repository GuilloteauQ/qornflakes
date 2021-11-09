{
  description = "a C flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      app_name = "main";
    in {

      packages.x86_64-linux.main = with pkgs;
        stdenv.mkDerivation {
          name = app_name;
          src = ./.;
          buildInputs = [ gcc coreutils ];
          installPhase = ''
            mkdir -p $out
            make ${app_name}
            mv ${app_name} $out/
          '';
        };

      defaultPackage.x86_64-linux = self.packages.x86_64-linux.main;

    };
}

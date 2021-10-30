{
  description = "My cookiecutter Flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.{{cookiecutter.derivation_name}} =  with (import nixpkgs { system = "x86_64-linux"; });
      stdenv.mkDerivation {
        name = "{{cookiecutter.flake_name}}";
        src = ./.;
        buildInputs = [
          python38
        ];
      };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.{{cookiecutter.derivation_name}};

  };
}

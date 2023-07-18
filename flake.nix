{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixpkgs.url = "github:nixos/nixpkgs/23.05";
    nur-kapack.url = "github:oar-team/nur-kapack";
    nur-kapack.inputs."nixpkgs".follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, pre-commit-hooks, nur-kapack }:
    let templates = import ./templates/nix_flake_templates.nix;
    in flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shellSet = import ./shells/default.nix { inherit pkgs; };
        kapack = nur-kapack.packages.${system};
      in rec {
        packages = (import ./pkgs/packages.nix { inherit pkgs kapack; });
        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt = { enable = true; };
              nix-linter = { enable = true; };
            };
          };
        };
        devShells = {
          check = nixpkgs.legacyPackages.${system}.mkShell {
            inherit (self.checks.${system}.pre-commit-check) shellHook;
          };
        } // shellSet;
      }) // {
        inherit templates;
        overlay = final: prev: import ./pkgs/packages.nix { pkgs = prev; };
      };
}

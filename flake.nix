{
  description = "A very basic flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nbpreview-src.url = "github:GuilloteauQ/nbpreview";
  };

  outputs = { self, nixpkgs, flake-utils, pre-commit-hooks, nbpreview-src }:
    let templates = import ./templates/nix_flake_templates.nix;
    in flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shellSet = import ./shells/default.nix { inherit pkgs; };
      in rec {
        packages = {
          inherit (nbpreview-src.packages.${system}) nbpreview;
          recorder = import ./pkgs/recorder/default.nix { inherit pkgs; };
          recorder-viz =
            import ./pkgs/recorder-viz/default.nix { inherit pkgs; };
          globus-cli = import ./pkgs/globus-cli/default.nix {
            inherit pkgs;
            qorn_globus_sdk = self.packages.${system}.globus-sdk;
          };
          globus-sdk = import ./pkgs/globus-sdk/default.nix { inherit pkgs; };
          globus-connect-personal =
            import ./pkgs/globus-connect-personnal/default.nix {
              inherit pkgs;
            };
          vanidl = import ./pkgs/vanidl/default.nix { inherit pkgs; };
          python-mip = import ./pkgs/python-mip/default.nix { inherit pkgs; };
          execo = import ./pkgs/execo/default.nix { inherit pkgs; };
          docker-rmd = import ./docker-images/rmd/default.nix { inherit pkgs; };
          uga_thesis_rmd =
            import ./pkgs/uga_thesis_rmd/default.nix { inherit pkgs; };
          qprez = import ./pkgs/qprez/default.nix { inherit pkgs; };
          facetscales = import ./pkgs/facetscales/default.nix { inherit pkgs; };
          httpimport = import ./pkgs/httpimport/default.nix { inherit pkgs; };
          jless = import ./pkgs/jless/default.nix { inherit pkgs; };
          geomtextpath =
            import ./pkgs/geomtextpath/default.nix { inherit pkgs; };
        } // import ./pkgs/MADbench2/default.nix {
          inherit pkgs;
          darshan-runtime = self.packages.${system}.darshan-runtime;
        } // import ./pkgs/darshan/default.nix { inherit pkgs; }
          // import ./pkgs/simul-cigri/default.nix { inherit pkgs; };
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
      };
}

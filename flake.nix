{
  description = "A very basic flake";

  inputs = { flake-utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, flake-utils }:
    let
      templates = import ./templates/nix_flake_templates.nix;
      cookiecutterTemplates =
        import ./cookiecutter_templates/cookiecutter_templates.nix;
      utils = import ./utils.nix;
    in flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        shellSet = import ./shells/default.nix { inherit pkgs; };
      in rec {
        packages = utils.build_cc_pkgs { inherit pkgs cookiecutterTemplates; }
          // shellSet // {
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
            docker-rmd =
              import ./docker-images/rmd/default.nix { inherit pkgs; };
            uga_thesis_rmd =
              import ./pkgs/uga_thesis_rmd/default.nix { inherit pkgs; };
          } // import ./pkgs/darshan/default.nix { inherit pkgs; };
      }) // {
        inherit templates;
      };
}

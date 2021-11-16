{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      cookiecutterTemplates = import ./cookiecutter_templates/cookiecutter_templates.nix;
      templates = import ./templates/nix_flake_templates.nix;
      utils = import ./utils.nix;
      shellSet = import ./shells/default.nix { inherit pkgs; };
    in rec {
      inherit templates;

      packages.x86_64-linux = utils.build_cc_pkgs { inherit pkgs cookiecutterTemplates; } // shellSet // {
        recorder = import ./pkgs/recorder/default.nix { inherit pkgs; };
        recorder-viz = import ./pkgs/recorder-viz/default.nix { inherit pkgs; };
        globus-cli = import ./pkgs/globus-cli/default.nix { inherit pkgs; qorn_globus_sdk = self.packages.x86_64-linux.globus-sdk; };
        globus-sdk = import ./pkgs/globus-sdk/default.nix { inherit pkgs; };
      };
    };
}

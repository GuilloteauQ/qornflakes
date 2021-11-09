{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      cookiecutterTemplates = import ./cookiecutter_templates/cookiecutter_templates.nix;
      templates = import ./templates/nix_flake_templates.nix;
      utils = import ./utils.nix;
      shellSet = import ./shells/default.nix { inherit pkgs; };
    in {
      inherit templates;

      packages.x86_64-linux = utils.build_cc_pkgs { inherit pkgs cookiecutterTemplates; } // shellSet;
    };
}

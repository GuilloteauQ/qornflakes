{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      cookiecutterTemplates = import ./cookiecutter_templates/cookiecutter_templates.nix;
      templates = import ./templates/nix_flake_templates.nix;
    in {
      inherit templates;

      packages.x86_64-linux = (builtins.mapAttrs (templateName: templateValue:
        pkgs.writeScriptBin "cookiecutter-${templateName}-template" ''
          #!${pkgs.stdenv.shell}
          ${pkgs.cookiecutter}/bin/cookiecutter ${templateValue.path} $@
        '') cookiecutterTemplates);
    };
}

{
  build_cc_pkgs = { pkgs, cookiecutterTemplates }:
    (builtins.mapAttrs (templateName: templateValue:
        pkgs.writeScriptBin "${templateValue.description}" ''
          #!${pkgs.stdenv.shell}
          ${pkgs.cookiecutter}/bin/cookiecutter ${templateValue.path} $@
        '') cookiecutterTemplates);

}

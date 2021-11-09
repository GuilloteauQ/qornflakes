let
  getPromptCmd = { name }:
    ''
    PROMPT="\[\e[40;1;37m\][nix-shell:\w (${name})]$ \[\e[40;0;37m\]"
  export PS1=$PROMPT
      '';


in {

    getShell = { pkgs, name, buildInputs, extraShellHook ? "" }:
pkgs.mkShell {
  inherit name buildInputs;

  shellHook = (getPromptCmd {inherit name;}) + extraShellHook;
};

}

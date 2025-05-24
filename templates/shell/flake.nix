{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/25.05";
  };

  nixConfig.bash-prompt = "(\\u@\\h) \\w [dev]\$ ";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [

          ];
        };
      };
    };
}

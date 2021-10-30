{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    templates = {
      R = {
        path = ./templates/R;
        description = "R and friends";
      };
    };
  };
}

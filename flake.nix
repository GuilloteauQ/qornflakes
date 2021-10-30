{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    templates = {
      R = {
        path = ./templates/R;
        description = "R and friends";
      };
      python = {
        path = ./templates/python;
        description = "a Python3.8 template";
      };
      md = {
        path = ./templates/markdown;
        description = "a Markdown + Pandoc template";
      };
      Rmd = {
        path = ./templates/Rmd;
        description = "a RMarkdown template";
      };
    };
  };
}

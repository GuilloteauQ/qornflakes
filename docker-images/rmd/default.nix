{ pkgs }:

with pkgs;
let
  tag = "2021-11-21";
  flakeImage = dockerTools.pullImage {
    imageName = "nixpkgs/nix-flakes";
    imageDigest =
      "sha256:86f00aa1c5b35c147f689ce9d0762d07bc477387726afad5f958238bab0b90d8";
    sha256 = "sha256-rnP1Lmf6G6K1Yazwy6r04zWmElcCvEVpW8kpy4pXvrM";
    os = "linux";
    arch = "amd64";
  };
  rImage = dockerTools.buildImage {
    name = "rstuff";
    inherit tag;
    fromImage = flakeImage;
    contents = [
        R
        rPackages.tidyverse
        rPackages.zoo
        rPackages.reshape2
    ];
  };
in
dockerTools.buildImage {
  name = "guilloteauq/nix-rmd";
  inherit tag;
  fromImage = rImage;
  contents = [
      pandoc
      rPackages.rmarkdown
      rPackages.markdown
      rPackages.knitr
      rPackages.magick
      rPackages.codetools
      texlive.combined.scheme-full
      bashInteractive
  ];
}

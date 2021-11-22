{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "uga_thesis_rmd";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "uga_thesis_rmd";
    rev = "e9b31710c66e13b9c689b0eb80cc32f3d6e01777";
    sha256 = "sha256-DatgP+m9mAs1mvxoCxEinzpd5SDPeMFaqxu9JV0ysH4";
  };
  buildInputs = with rPackages; [
    R
    tidyverse
    bookdown
    knitr
    here
    R_utils
  ];
}

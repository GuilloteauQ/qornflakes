{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "c462c39f5c8fa90b091f6ed66157b296fd4c2f52";
    sha256 = "sha256-O5kBZ9CN/uxLpq8HkRqKrfYmuAHc1lvgEprC+MVVlLQ";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

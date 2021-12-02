{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "3be811364fb1966dc09aaec656a00542f031ae22";
    sha256 = "sha256-pkfbq5jsZ0IileKw1wSCWjG4ZUm6x7IeYpHpkGwTiU0";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

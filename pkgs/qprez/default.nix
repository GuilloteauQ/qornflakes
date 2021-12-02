{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "74867727eafa1aeaa421faced8d94c56aebcd224";
    sha256 = "sha256-eBurwH3JjuFz8JjXlRQNMR+T9K1PywY38NRsb1Nu6Gw";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

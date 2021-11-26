{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "e220904820e35f033c4cf953cabbe3c35e64ab8f";
    sha256 = "sha256-qhyPogxrho78hzvpGyYE7nBn9lIW1rXFq7tCRrnUlcY";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

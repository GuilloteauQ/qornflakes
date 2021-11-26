{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "cfb5ce0969921c0e35db56113f6da1619d8ab5b5";
    sha256 = "sha256-OBAEfHjpKRatdyMJ2/YFWPmaD6UUbonV4A/wfZv4n70";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

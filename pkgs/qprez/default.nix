{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "35a7010c8d5bf06234d6ce8d57dcaa2c6b3f0ffa";
    sha256 = "sha256-CQtAogmEoniinSqByA1k0N3pyIhOvD6OjPrzw+4dZAo";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

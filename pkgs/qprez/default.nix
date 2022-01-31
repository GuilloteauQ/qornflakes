{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    # rev = "35a7010c8d5bf06234d6ce8d57dcaa2c6b3f0ffa";
    rev = "3d012388e269170e1f48f0287e9dcfdfa1bdaf50";
    # sha256 = "sha256-CQtAogmEoniinSqByA1k0N3pyIhOvC6OjPrzw+4dZAo";
    sha256 = "sha256-xfy1eAAyhQJnywNwaKl+SCj/CW6hQnrECGAvl6xU1C0";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

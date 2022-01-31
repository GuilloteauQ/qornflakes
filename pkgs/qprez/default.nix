{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    # rev = "35a7010c8d5bf06234d6ce8d57dcaa2c6b3f0ffa";
    rev = "5eea5311ba04ac411876a0b2f12fe9a0b95d7363";
    # sha256 = "sha256-CQtAogmEoniinSqByA1k0N3pyIhOvC6OjPrzw+4dZAo";
    sha256 = "sha256-1/nq1qKLw2/1nqDnLdOvC8XTRwvSZBbMyoatpg6C6eA";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

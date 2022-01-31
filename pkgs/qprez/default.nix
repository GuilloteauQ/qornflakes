{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    # rev = "35a7010c8d5bf06234d6ce8d57dcaa2c6b3f0ffa";
    rev = "7a20949b313c525f309564c92f8df2fa00846bdf";
    # sha256 = "sha256-CQtAogmEoniinSqByA1k0N3pyIhOvC6OjPrzw+4dZAo";
    sha256 = "sha256-BjU2uG6x6UAlt6dz+MMrMzh4sjFBZY1Yk5bXUossbjU";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

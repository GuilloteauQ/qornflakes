{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    # rev = "35a7010c8d5bf06234d6ce8d57dcaa2c6b3f0ffa";
    rev = "06ecfa7a83a3d1f19742765157ecd24ca2c60a42";
    # sha256 = "sha256-CQtAogmEoniinSqByA1k0N3pyIhOvC6OjPrzw+4dZAo";
    sha256 = "sha256-CdXU0PRKKEQs7Uskv7RIXihFbF/cMhxt2bcdeggLBcA";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "eb9f66376b11153a8d66af3965d9bfed3d150acb";
    sha256 = "sha256-ciBW3DJdgRdA1HIEnaryzmZVRSwIiNzEJke8PpBv69Y";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

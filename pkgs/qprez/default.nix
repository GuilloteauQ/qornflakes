{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "ff40ff718f0f2e89a337824f5fa448ef971f47a5";
    sha256 = "sha256-rqp6yqAE14k8nvFOvjGxjHQjPMG96BX7XsIxfUSuXDg";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

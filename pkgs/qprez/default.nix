{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "ab0d19173097dde763b214e49b94ad00196bd16e";
    sha256 = "sha256-u2VxQ68xz6ckQ//3S2pUWu28bJR9yENNZ8Zd3iEt7dA";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

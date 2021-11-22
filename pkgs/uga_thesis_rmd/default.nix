{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "uga_thesis_rmd";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "uga_thesis_rmd";
    rev = "6d446bde5afb01294f32b30f21bfc0e271cdfb14";
    sha256 = "sha256-HV0Ff5e6+FdE72Vl/0N3RP4f+eQTEEnWkqQpnof8fEM";
  };
  buildInputs = with rPackages; [
    R
    bookdown
    knitr
    R_utils
  ];
}

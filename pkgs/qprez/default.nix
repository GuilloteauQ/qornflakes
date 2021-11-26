{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "f781a9ec99ec4c613bffb46ea109efbbf8b43d4c";
    sha256 = "sha256-0k8AJnID7meIfuhUcWro4P3KuSJCbNSVwtlMXww/Oxw";
  };
  buildInputs = with rPackages; [
    R
    rmarkdown
    knitr
    R_utils
  ];
}

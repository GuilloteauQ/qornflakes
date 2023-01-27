{ pkgs }:
with pkgs;
python3Packages.buildPythonPackage rec {
  name = "sippy";
  version = "master";
  src = pkgs.fetchgit {
    url = "https://github.com/CPCLAB-UNIPI/SIPPY";
    rev = "0a542bd259600d486b5a90a8a892e598fe6a0878";
    sha256 = "sha256-byCY/cYjEKFfVsSbUysrMtfLEXJyEUk7riAKlTaNQdA=";
  };
  propagatedBuildInputs = with python3Packages; [
    numpy
    scipy
    control
    math
    slycot
    future
  ];
  # doCheck = false;
}

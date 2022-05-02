{ pkgs }:
with pkgs;
python3Packages.buildPythonPackage rec {
  name = "pyhst2";
  version = "0.7.2";
  src = fetchgit {
    url = "https://gitlab.esrf.fr/mirone/pyhst2";
    rev = "ffbf0c9a93dd961e15b639bd59f3007ad711139e";
    sha256 = "0000000000000000000000000000000000000000000000000000";
  };
  doCheck = false;
}

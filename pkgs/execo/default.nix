{ pkgs }:
with pkgs;
python3Packages.buildPythonPackage rec {
  name = "execo";
  version = "2.6.8";
  src = pkgs.fetchgit {
    url = "https://gitlab.inria.fr/mimbert/execo";
    rev = "ca10f79cbdc049539ec964815421722ee0b46cd0";
    sha256 = "sha256-byCY/cYjEKFfVsSbUysrMtfLEXJyEUK7riAKlTaNQdA=";
    leaveDotGit = true;
  };
  # nativeBuildInputs = [ git ];
  # propagatedBuildInputs = with python38Packages; [ cffi setuptools_scm ];
  doCheck = false;
}

{ pkgs }:
with pkgs;
python3Packages.buildPythonPackage rec {
  name = "python-sharelatex";
  version = "1.0.0";
  src = pkgs.fetchgit {
    url = "https://gitlab.inria.fr/sed-rennes/sharelatex/python-sharelatex";
    rev = "41bf803b95fc7c44f7026af319c8c8d276b073f2";
    sha256 = "sha256-hIyxkBPibTZhnZUAIVOqv/sjuixAgA7lnqhOztsUD/I";
  };
  propagatedBuildInputs = with python3Packages; [  ];
  doCheck = false;
}

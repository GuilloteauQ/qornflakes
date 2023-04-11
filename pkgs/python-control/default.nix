{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "python-control";
  version = "0.9.2";

  src = fetchFromGitHub {
    owner = "python-control";
    repo = pname;
    rev = "3b5f1990bf47180714423c420320f013bdd4dfaa";
    sha256 = "sha256-ZG/FllrFLaGQZOuRhEInlWi0GFalOqRRO56uiA6l0t8=";
  };

  propagatedBuildInputs = with python3Packages; [ matplotlib scipy ];
  doCheck = false;
}

{ python3Packages, fetchFromGitLab }:
python3Packages.buildPythonPackage rec {
  name = "concerto";
  version = "0.1";
  src = fetchFromGitLab {
    domain = "gitlab.inria.fr";
    owner = "VeRDi-project";
    repo = "concerto";
    rev = "dca88d662e1c27f426657bdffdb57e7c8b09b30b";
    sha256 = "sha256-M11aOSOZWH+6WbnexM7yhltn1c2kpzrm8Kk/cdQXCic=";
  };
  propagatedBuildInputs = with python3Packages; [
  ];
  doCheck = false;
}

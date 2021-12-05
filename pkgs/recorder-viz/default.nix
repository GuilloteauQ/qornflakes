{ pkgs }:
with pkgs;
python38Packages.buildPythonPackage rec {
  name = "recorder-viz";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "wangvsa";
    repo = "recorder-viz";
    rev = "9160cf658d9e1f4c64d34c33e7e257a65a2d7c1d";
    sha256 = "sha256-alnUyup+mQGd7922zC+y6BtEv8mqyiSDQJqnA2Kox04";
  };
  propagatedBuildInputs = with python38Packages; [
    pandas
    bokeh
    prettytable
    # requests
  ];
  doCheck = false;
}

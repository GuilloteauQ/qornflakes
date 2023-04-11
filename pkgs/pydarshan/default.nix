{ python3Packages, fetchFromGitHub, darshan-util }:

let
  rootSrc = fetchFromGitHub {
    owner = "darshan-hpc";
    repo = "darshan";
    rev = "06faec6ae09081078da1d85e3737928361ade8f1";
    sha256 = "sha256-5rGsA21GrMg7b3UGi1ShJHX/lmfXA01nY6ZTacNgZRA";
  };
in
python3Packages.buildPythonPackage rec {
  name = "pydarshan";
  version = "0.1";
  src = "${rootSrc}/darshan-util/pydarshan";
  propagatedBuildInputs = with python3Packages; [
    cffi
    numpy
    pandas
    matplotlib
    pytest
    pytest-runner
    darshan-util
  ];
  doCheck = false;
}
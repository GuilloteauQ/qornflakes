{ pkgs, qorn_globus_sdk }:
with pkgs;
python38Packages.buildPythonPackage rec {
  name = "globus-cli";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-cli";
    rev = "b8b2fd9654a9eb32eec813f0e5b0b5ea425ade95";
    sha256 = "sha256-8v2yna3R9OMSmNI4z0tUUkHP5u0MHq8qZPNf2cufyKQ";
  };
  propagatedBuildInputs = with python38Packages; [
    click
    jmespath
    requests
    qorn_globus_sdk
  ];
  doCheck = false;
}

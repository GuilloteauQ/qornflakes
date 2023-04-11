{ python3Packages, fetchFromGitHub, globus-sdk }:

python3Packages.buildPythonPackage rec {
  name = "globus-cli";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-cli";
    rev = "b8b2fd9654a9eb32eec813f0e5b0b5ea425ade95";
    sha256 = "sha256-8v2yna3R9OMSmNI4z0tUUkHP5u0MHq8qZPNf2cufyKQ";
  };
  propagatedBuildInputs = with python3Packages; [
    click
    jmespath
    requests
  ] ++ [ globus-sdk];
  doCheck = false;
}

{ pkgs }:
with pkgs;

python3Packages.buildPythonPackage rec {
    pname = "sysidentpy";
    version = "0.2.1";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-xkAMVqxAy9zx2P6R8I/Xz7afQJP0c0I8hddrKeEcPF4=";
    };
    propagatedBuildInputs = [
      numpy
      matplotlib
      pytorch
    ];
  }


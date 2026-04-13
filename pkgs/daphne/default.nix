{ stdenv, fetchFromGitHub, cmake, ninja, pkg-config, python3Packages, antlr-cpp }:

stdenv.mkDerivation {
  pname = "daphne";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "daphne-eu";
    repo = "daphne";
    rev = "0.1";
    sha256 = "sha256-EHsY3N6/x96j4M/lAwKszQ31a5nWPjTZTaa9IfaIlpc=";
  };

  buildInputs = [
    cmake
    ninja
    pkg-config
    antlr-cpp
  ];

  propagatedBuildInputs = with python3Packages; [
    python
    numpy
    pandas
  ];

}

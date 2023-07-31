{ stdenv, fetchFromGitHub, cmake, ninja, pkg-config, openjdk }:

let
  antlrsrc = fetchFromGitHub {
    owner = "antlr";
    repo = "antlr4";
    rev = "d2e25842dfa1a7daadfce6fdf2197df5f2b7589e";
    sha256 = "sha256-T5mo6tnnMbYsI8Y3NiImIOjHroEN4xymIEzabHx3EYY=";
  };
in

stdenv.mkDerivation {
  pname = "antlr-cpp";
  version = "master";
  src = "${antlrsrc}/runtime/Cpp";

  buildInputs = [
    cmake
    ninja
    pkg-config
  ];

  propagatedBuildInputs = [
    openjdk
  ];

  cmakeFlags = [
    "-DANTLR_BUILD_CPP_TESTS=OFF"
  ];
}

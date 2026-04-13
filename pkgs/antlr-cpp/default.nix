{ stdenv, fetchzip, fetchFromGitHub, cmake, ninja, pkg-config, openjdk }:

let
  antlrsrc = fetchFromGitHub {
    owner = "antlr";
    repo = "antlr4";
    rev = "d2e25842dfa1a7daadfce6fdf2197df5f2b7589e";
    sha256 = "sha256-T5mo6tnnMbYsI8Y3NiImIOjHroEN4xymIEzabHx3EYY=";
  };

  url = "https://www.antlr.org/download/antlr4-cpp-runtime-4.13.0-source.zip";
in

stdenv.mkDerivation {
  pname = "antlr-cpp";
  version = "master";
  src = "${antlrsrc}/runtime/Cpp";
  # src = "${antlrsrc}/runtime/Cpp";
  # src = fetchzip {
  #   inherit url;
  #   sha256 = "sha256-dRo9LMYAdhRwg4w4s/LhWwMGkG90VkIxCMVp9wfrGLY=";
  #   stripRoot=false;
  # };

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
    "-DANTLR4_INSTALL=True"
  ];
}

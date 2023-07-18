{ stdenv, fetchFromGitHub, cmake, boost, asciidoc, flex, bison, fmt }:

stdenv.mkDerivation rec {
  name = "pajeng";
  version = "1.3.6";
  src = fetchFromGitHub {
    owner = "schnorr";
    repo = name;
    rev = version;
    sha256 = "sha256-oKp0RpO6PLK+G8aRU9BlYR2O6yCczWerRrZejUR/cQ8=";
  };
  buildInputs = [
    cmake
    boost
    asciidoc
    flex
    bison
    fmt
  ];
  buildPhase = ''
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXE_LINKER_FLAGS="-Wl,-rpath=$out/lib" ..
    make install
  '';
}

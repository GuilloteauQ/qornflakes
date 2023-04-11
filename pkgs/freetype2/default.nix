{ stdenv, fetchFromGitHub, coreutils, automake, autobuild, autoconf, gcc, libtool, gnumake, zlib }:

stdenv.mkDerivation {
  name = "freetype2";
  version = "2.10";
  src = fetchFromGitHub {
    owner = "aseprite";
    repo = "freetype2";
    rev = "fbbcf50367403a6316a013b51690071198962920";
    sha256 = "sha256-Ijlga9nfbhaT+5rS0QVKyTlqCq2EASKQm/FIqTxyUfE";
  };
  buildInputs = [
    coreutils
    automake
    autobuild
    autoconf
    gcc

    libtool
    gnumake
    zlib
  ];
  phases = [ "unpackPhase" "buildPhase" ];
  buildPhase = ''
    mkdir -p $out
    sh autogen.sh
    ./configure --prefix=$out --with-zlib=${zlib.dev}
    make
    make install
  '';
}

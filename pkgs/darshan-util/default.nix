{ fetchFromGitHub
, stdenv
, coreutils
, automake
, autobuild
, autoconf
, libtool
, zlib
, python3
, bzip2
, libarchive
, gnuplot
, darshan-perl
, epstool
, texlive
, makeWrapper
, lib
}:

let
  rootSrc = fetchFromGitHub {
    owner = "darshan-hpc";
    repo = "darshan";
    rev = "06faec6ae09081078da1d85e3737928361ade8f1";
    sha256 = "sha256-5rGsA21GrMg7b3UGi1ShJHX/lmfXA01nY6ZTacNgZRA";
  };
in
stdenv.mkDerivation {
  name = "darshan-util";
  version = "3.3";
  src = "${rootSrc}";
  buildInputs = [
    coreutils
    automake
    autobuild
    autoconf
    libtool
    zlib
    python3
    bzip2
    libarchive
  ];
  nativeBuildInputs = [ makeWrapper ];
  buildPhase = ''
    mkdir -p $out/build
    cd darshan-util
    autoreconf -fi
    ./configure --prefix=$out --with-zlib=${zlib.dev} --without-bzlib

    make
    make install
  '';
  fixupPhase = ''
    wrapProgram $out/bin/darshan-job-summary.pl --prefix PATH ":" ${
      lib.makeBinPath [
        gnuplot
        darshan-perl
        epstool
        texlive.combined.scheme.full
      ]
    }
  '';
}

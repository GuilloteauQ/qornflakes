{ stdenv, fetchFromGitHub, coreutils, automake, autobuild, autoconf, libtool, zlib, mpich, lib, makeWrapper, darshan-perl }:

let
  rootSrc = fetchFromGitHub {
    owner = "darshan-hpc";
    repo = "darshan";
    rev = "06faec6ae09081078da1d85e3737928361ade8f1";
    sha256 = "sha256-5rGsA21GrMg7b3UGi1ShJHX/lmfXA01nY6ZTacNgZRA";
  };
in
stdenv.mkDerivation {
  name = "darshan-runtime";
  version = "3.3";
  src = "${rootSrc}";
  buildInputs = [ coreutils automake autobuild autoconf libtool zlib mpich ];
  nativeBuildInputs = [ makeWrapper ];
  buildPhase = ''
    mkdir -p $out/build
    cd darshan-runtime
    autoreconf -fi
    ./configure --prefix=$out --with-log-path=/tmp/darshan-logs --with-jobid-env=PBS_JOBID CC=mpicc --enable-group-readable-logs

    make
    make install
  '';
  fixupPhase = ''
    for f in $(ls $out/bin/*.pl); do
        sed -i 's#/usr/bin/perl#${darshan-perl}/bin/perl#g' $f
        wrapProgram $f --prefix PATH ":" ${lib.makeBinPath [ darshan-perl ]}
      done
  '';
}

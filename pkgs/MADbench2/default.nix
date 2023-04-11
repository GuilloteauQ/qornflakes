{ stdenv, mpi, useDarshan ? false, darshan-runtime, lib, bash }:

stdenv.mkDerivation {
  name = "MADbench2";
  src = ./.;
  buildInputs = [ mpi ] ++ lib.optionals useDarshan [ darshan-runtime ];
  buildPhase = if useDarshan then ''
    ${darshan-runtime}/bin/darshan-gen-cc.pl ${mpi}/bin/mpicc --output mpicc.darshan
    ${bash}/bin/bash mpicc.darshan -D SYSTEM -D COLUMBIA -D IO -o MADbench2.x MADbench2.c -lm -pthread -lrt -ldl
  '' else ''
     ${mpi}/bin/mpicc -D SYSTEM -D COLUMBIA -D IO -o MADbench2.x MADbench2.c -lm
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv MADbench2.x $out/bin
  '';
}


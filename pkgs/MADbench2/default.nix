{ pkgs, darshan-runtime }:
with pkgs; {
  MADbench2 = stdenv.mkDerivation {
    name = "MADbench2";
    src = ./.;
    buildInputs = [ openmpi ];
    installPhase = ''
      mkdir -p $out/bin
      mpicc -D SYSTEM -D COLUMBIA -D IO -o MADbench2.x MADbench2.c -lm
      mv MADbench2.x $out/bin
    '';
  };
  MADbench2-darshan = stdenv.mkDerivation {
    name = "MADbench2-darshan";
    src = ./.;
    buildInputs = [ mpich darshan-runtime ];
    installPhase = ''
      mkdir -p $out/bin
      ${darshan-runtime}/bin/darshan-gen-cc.pl ${mpich}/bin/mpicc --output mpicc.darshan
      ${pkgs.bash}/bin/bash mpicc.darshan -D SYSTEM -D COLUMBIA -D IO -o MADbench2.x MADbench2.c -lm -pthread -lrt -ldl
      mv MADbench2.x $out/bin
    '';
  };
}


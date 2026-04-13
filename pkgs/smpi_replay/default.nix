{ stdenv, simgrid }:

stdenv.mkDerivation {
  name = "smpi_replay";
  version = simgrid.version;
  src = simgrid.src;#}/examples/smpi/replay";
  buildInputs = [
    simgrid
  ];
  buildPhase = ''
    ${simgrid}/bin/smpicxx examples/smpi/replay/replay.cpp -O3 -o smpi_replay
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp smpi_replay $out/bin
  '';
}

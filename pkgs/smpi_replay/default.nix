{ stdenv, simgrid }:

stdenv.mkDerivation {
  name = "smpi_replay";
  version = simgrid.version;
  src = "${simgrid.src}/examples/smpi/replay";
  propagatedBuildInputs = [
    simgrid
  ];
  buildPhase = ''
    smpicxx replay.cpp -O3 -o smpi_replay
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp smpi_replay $out/bin
  '';
}

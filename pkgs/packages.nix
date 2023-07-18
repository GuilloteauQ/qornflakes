{ pkgs, kapack }:

rec {
  darshan-perl = pkgs.callPackage ./darshan-perl { };
  darshan-runtime = pkgs.callPackage ./darshan-runtime { inherit darshan-perl; };
  darshan-util = pkgs.callPackage ./darshan-util { inherit darshan-perl; };

  facetscales = pkgs.callPackage ./facetscales { };
  freetype2 = pkgs.callPackage ./freetype2 { };

  geomtextpath = pkgs.callPackage ./geomtextpath { inherit myTextshaping; };
  ggpattern = pkgs.callPackage ./ggpattern { };
  globus-cli = pkgs.callPackage ./globus-cli { inherit globus-sdk; };
  globus-connect-personal = pkgs.callPackage ./globus-connect-personnal { };
  globus-sdk = pkgs.callPackage ./globus-sdk { };

  hackernewsTUI = pkgs.callPackage ./hackernews-TUI { };
  httpimport = pkgs.callPackage ./httpimport { };

  ior-simgrid = pkgs.ior.overrideAttrs (finalAttrs: previousAttrs: {
    pname = "ior-simgrid";
    propagatedBuildInputs = [ pkgs.simgrid ];
    configurePhase = ''
      ./bootstrap && SMPI_PRETEND_CC=1 ./configure --prefix=$out MPICC=${pkgs.simgrid}/bin/smpicc CC=${pkgs.simgrid}/bin/smpicc
    '';
  });

  jless = pkgs.callPackage ./jless { };

  madbench2 = pkgs.callPackage ./MADbench2 { mpi = pkgs.openmpi; inherit darshan-runtime; };
  madbench2-darshan = pkgs.callPackage ./MADbench2 { mpi = pkgs.mpich; useDarshan = true; inherit darshan-runtime; };
  myTextshaping = pkgs.callPackage ./mytextshaping { inherit freetype2; };

  ondes3d = pkgs.callPackage ./ondes3d { };

  pajeng = pkgs.callPackage ./pajeng { };
  pajengr = pkgs.callPackage ./pajengr { inherit pajeng; };
  pydarshan = pkgs.callPackage ./pydarshan { inherit darshan-util; };
  python-control = pkgs.callPackage ./python-control { };

  qprez = pkgs.callPackage ./qprez { };

  recorder = pkgs.callPackage ./recorder { };
  recorder-viz = pkgs.callPackage ./recorder-viz { };

  snakefmt = pkgs.callPackage ./snakefmt { };
  starpu = pkgs.callPackage ./starpu { };

  topo5k = pkgs.callPackage ./topo5k { execo = kapack.execo; };

  uga_thesis_rmd = pkgs.callPackage ./uga_thesis_rmd { };

  vanidl = pkgs.callPackage ./vanidl { };
}


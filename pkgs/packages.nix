{ pkgs }:

let
  darshan = import ./darshan/default.nix { inherit pkgs; };

in
darshan // rec {
  starpu = pkgs.callPackage ./starpu { };
  snakefmt = pkgs.callPackage ./snakefmt { };
  python-control = pkgs.callPackage ./python-control { };
  ondes3d = pkgs.callPackage ./ondes3d { };
  recorder = pkgs.callPackage ./recorder { };
  recorder-viz =
    pkgs.callPackage ./recorder-viz { };
  globus-cli = pkgs.callPackage ./globus-cli {
    inherit globus-sdk;
  };
  globus-sdk = pkgs.callPackage ./globus-sdk { };
  globus-connect-personal =
    pkgs.callPackage ./globus-connect-personnal { };
  vanidl = pkgs.callPackage ./vanidl { };
  uga_thesis_rmd =
    pkgs.callPackage ./uga_thesis_rmd { };
  qprez = pkgs.callPackage ./qprez { };
  facetscales = pkgs.callPackage ./facetscales { };
  ggpattern = pkgs.callPackage ./ggpattern { };
  httpimport = pkgs.callPackage ./httpimport { };
  jless = pkgs.callPackage ./jless { };
  hackernewsTUI = import ./hackernews-TUI/default.nix { inherit pkgs; };
  pyhst2 = import ./pyhst/default.nix { inherit pkgs; };
  geomtextpath =
    import ./geomtextpath/default.nix { inherit pkgs; };
} // import ./MADbench2/default.nix {
  inherit pkgs; darshan-runtime = darshan.darshan-runtime;
}
  // import ./simul-cigri/default.nix { inherit pkgs; }


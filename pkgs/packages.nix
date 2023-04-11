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
  globus-sdk = import ./globus-sdk/default.nix { inherit pkgs; };
  globus-connect-personal =
    import ./globus-connect-personnal/default.nix {
      inherit pkgs;
    };
  vanidl = import ./vanidl/default.nix { inherit pkgs; };
  python-mip = import ./python-mip/default.nix { inherit pkgs; };
  execo = import ./execo/default.nix { inherit pkgs; };
  enoslib = import ./enoslib/default.nix { inherit pkgs; };
  uga_thesis_rmd =
    import ./uga_thesis_rmd/default.nix { inherit pkgs; };
  qprez = import ./qprez/default.nix { inherit pkgs; };
  facetscales = import ./facetscales/default.nix { inherit pkgs; };
  ggpattern = import ./ggpattern/default.nix { inherit pkgs; };
  httpimport = import ./httpimport/default.nix { inherit pkgs; };
  jless = import ./jless/default.nix { inherit pkgs; };
  hackernewsTUI = import ./hackernews-TUI/default.nix { inherit pkgs; };
  pyhst2 = import ./pyhst/default.nix { inherit pkgs; };
  geomtextpath =
    import ./geomtextpath/default.nix { inherit pkgs; };
} // import ./MADbench2/default.nix {
  inherit pkgs; darshan-runtime = darshan.darshan-runtime;
}
  // import ./simul-cigri/default.nix { inherit pkgs; }


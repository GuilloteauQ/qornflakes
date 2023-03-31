{ pkgs }:

let
  darshan = import ./darshan/default.nix { inherit pkgs; };

in
darshan // rec {
  starpu = import ./starpu/default.nix {inherit pkgs;};
  # typst = import ./typst/default.nix { inherit pkgs; };
  # the-littlest-jupyterhub = import ./the-littlest-jupyterhub/default.nix { inherit pkgs; };

  snakefmt = import ./snakefmt/default.nix { inherit pkgs; };
  # sysidentpy = import ./sysidentpy/default.nix { inherit pkgs; };
  # sippy = import ./sippy/default.nix { inherit pkgs; control = python-control;};
  # marksman = import ./marksman/default.nix { inherit pkgs; };
  python-control = import ./python-control/default.nix { inherit pkgs; };
  # python-sharelatex = import ./python-sharelatex/default.nix { inherit pkgs; };
  ondes3d = import ./ondes3d/default.nix { inherit pkgs; };
  recorder = import ./recorder/default.nix { inherit pkgs; };
  recorder-viz =
    import ./recorder-viz/default.nix { inherit pkgs; };
  globus-cli = import ./globus-cli/default.nix {
    inherit pkgs;
    qorn_globus_sdk = globus-sdk;
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


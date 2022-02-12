{ pkgs }:
with pkgs;
let
  src = fetchgit {
    url = "https://gitlab.inria.fr/cigri-ctrl/cigrisimul";
    rev = "0c0ce49f99124a2355ada44347b749f21d88cbc7";
    sha256 = "sha256-tU4D0g2MxEWD2QnOtoXNSWGznylwtuqrWsNZ15+GyDU=";
  };

  rPkgs = with rPackages; [ tidyverse reshape2 gridExtra ];

  myR = pkgs.rWrapper.override { packages = rPkgs; };

in rec {
  sigri = rustPlatform.buildRustPackage rec {
    pname = "cigri-simul";
    version = "0.0.1";
    inherit src;

    cargoSha256 = "sha256-jh47TNyopP7Ay1wPxsRV4PI2zaWkMM9jJosLDAMN4oU=";
    verifyCargoDeps = true;
  };

  sigri-summary = writeScriptBin "sigri-summary" ''
    ${myR}/bin/Rscript ${src}/R/plot.R $1
  '';

  sigri-docker = dockerTools.buildImage {
    name = "guilloteauq/sigri";
    tag = "latest";

    contents = sigri;
    config = {
      # docker run -it --rm -v "$(pwd):/data" sigri experiments/mfc.yml
      Entrypoint = [ "${sigri}/bin/cigri-simul" ];
      WorkingDir = "/data";
      Volumes = { "/data" = { }; };
    };
  };
}

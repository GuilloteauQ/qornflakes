{ pkgs }:
with pkgs;
let
  src = fetchgit {
    url = "https://gitlab.inria.fr/cigri-ctrl/cigrisimul";
    rev = "34e00bc763907d9113b708bfe33f409e4996c60e";
    sha256 = "sha256-xp0JioezlGLI3Pw8XIDDwWfdgagBtcuXwMxKX3OPg2Q=";
  };

  rPkgs = with rPackages; [ tidyverse reshape2 ];

  myR = pkgs.rWrapper.override { packages = rPkgs; };

in rec {
  sigri = rustPlatform.buildRustPackage rec {
    pname = "cigri-simul";
    version = "0.0.1";
    inherit src;

    cargoSha256 = "sha256-jh47TNyopP7Ay1wPxsRV4PI2zaWkMM9jJosLDAMN4oU=";
    verifyCargoDeps = true;
  };

  sigri-sum = writeScriptBin "sigri-sum" ''
    ${myR}/bin/Rscript ${src}/R/plot.R $1
  '';
}

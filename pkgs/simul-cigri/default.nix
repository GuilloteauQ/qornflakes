{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "cigri-simul";
  version = "0.0.1";

  src = fetchgit {
    url = "https://gitlab.inria.fr/cigri-ctrl/cigrisimul";
    rev = "f064cf7060c1b9f9fc5a3165b444d6125eb85a4b";
    sha256 = "sha256-V6h11OKaQKLtq1dBLL7APMRTepTPRKdHOK0zEM32arI=";
  };

  cargoSha256 = "sha256-jh47TNyopP7Ay1wPxsRV4PI2zaWkMM9jJosLDAMN4oU=";
  verifyCargoDeps = true;
}

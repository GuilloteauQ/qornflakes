{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "cigrisimul";
  version = "0.0.1";

  src = fetchgit {
    url = "https://gitlab.inria.fr/cigri-ctrl/cigrisimul";
    rev = "f064cf7060c1b9f9fc5a3165b444d6125eb85a4b";
    sha256 = "sha256-V6h11OKaQKLtq1dBLL7APMRTepTPRKdHOK0zEM32arI=";
  };

  cargoSha256 = "sha256-pAj9I9By0yuhT4Wr0MOSz/VJinrC1TxXXQZMaWZeNH4=";
  verifyCargoDeps = true;
}

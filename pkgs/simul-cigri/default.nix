{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "cigrisimul";
  version = "0.0.1";

  src = fetchgit {
    url = "https://gitlab.inria.fr/cigri-ctrl/cigrisimul";
    rev = "6b921f00fe44c518895ac971a9960c7bf9784ef6";
    sha256 = "sha256-LQq18d+kQvGu4Jaiiu1xJXYDvgJXa2yNBA8k3MK8Ngs=";
  };

  cargoSha256 = "sha256-pAj9I9By0yuhT4Wr0MOSz/VJinrC1TxXXQZMaWZeNH4=";
  verifyCargoDeps = true;
}

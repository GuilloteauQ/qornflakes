{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "jless";
  version = "v0.7.1";

  src = fetchFromGitHub {
    owner = "PaulJuliusMartinez";
    repo = pname;
    rev = "b3f21a215a9f3b12156f542cc78f330624d5faf1";
    sha256 = "sha256-gBqyo/N/qF6HCTUrSKNVLiL1fc/JTfip1kNpNCBzRT8";
  };

  cargoSha256 = "sha256-eG9lxUhcIC/VrS0afHDxyJf3ffRGEK97pQGzawzASBk";
  verifyCargoDeps = true;
}

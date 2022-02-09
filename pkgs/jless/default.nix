{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "jless";
  version = "v0.7.1";

  src = fetchFromGitHub {
    owner = "PaulJuliusMartinez";
    repo = pname;
    rev = version;
    sha256 = "sha256-gBqyo/N/qF6HCTUrSKNVLiL1fc/JTfip1kNpNCBzRT8";
  };

  cargoSha256 = "sha256-eG9lxUhcIC/VrS0afHDxyJf3ffRGEK97pQGzawzASBk";
  verifyCargoDeps = true;
}

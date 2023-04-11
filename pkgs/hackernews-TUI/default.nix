{ rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "hackernews-TUI";
  version = "v0.7.1";

  src = fetchFromGitHub {
    owner = "aome510";
    repo = pname;
    rev = "8f30cc728df73257888dba7afbc812b4065c93db";
    sha256 = "sha256-gBqyo/N/qF6HCTUrSKNVLiL1fc/JTgip1kNpNCBzRT8=";
  };

  cargoSha256 = "sha256-eG9lxUhcIC/VrS0afHDxyJf3fgRGEK97pQGzawzASBk=";
  verifyCargoDeps = true;
}

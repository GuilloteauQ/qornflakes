{ pkgs }:
with pkgs;
rustPlatform.buildRustPackage rec {
  pname = "jless";
  version = "v0.7.1";

  src = fetchFromGitHub {
    owner = "PaulJuliusMartinez";
    repo = pname;
    rev = version;
    sha256 = "1y2irlnha0dj63zp3dfbmrhssjj9qdxcl7h5sfr5nxf6dd4vjccg";
  };

  cargoSha256 = "0drf5xnqin26zdyvx9n2zzgahcnrna0y56cphk2pb97qhpakvhbj";
  verifyCargoDeps = true;
}

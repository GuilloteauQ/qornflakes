{ fetchFromGitHub, rPackages, freetype2 }:

rPackages.buildRPackage rec {
  name = "textshaping";
  version = "0.3.6";
  src = fetchFromGitHub {
    owner = "r-lib";
    repo = "textshaping";
    rev = "0ae8e32a2dab09a920db4b6a60fc10380ba1c4bc";
    sha256 = "sha256-GBN1vSeO4YNxsVrtx+OTAGqFRWkUnJQDA6e+GS5pnDY";
  };
  buildInputs = with rPackages; [
    R
    R_utils
    systemfonts
    cpp11
    harfbuzz
    freetype2
    fribidi
    pkg-config
  ];
}


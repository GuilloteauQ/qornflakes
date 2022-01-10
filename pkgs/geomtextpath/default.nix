{ pkgs }:
with pkgs;

let
  freetype2 = stdenv.mkDerivation {
    name = "freetype2";
    version = "2.10";
    src = fetchFromGitHub {
      owner = "aseprite";
      repo = "freetype2";
      rev = "fbbcf50367403a6316a013b51690071198962920";
      sha256 = "sha256-Ijlga9nfbhaT+5rS0QVKyTlqCq2EASKQm/FIqTxyUfE";
    };
    buildInputs = [
      coreutils
      automake
      autobuild
      autoconf
      gcc

      libtool
      gnumake
      zlib
    ];
    phases = [ "unpackPhase" "buildPhase" ];
    buildPhase = ''
      mkdir -p $out
      sh autogen.sh
      ./configure --prefix=$out --with-zlib=${pkgs.zlib.dev}
      make
      make install
    '';
  };
  myTextshaping = rPackages.buildRPackage rec {
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
  };

in rPackages.buildRPackage rec {
  name = "geomtextpath";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "AllanCameron";
    repo = "geomtextpath";
    rev = "9fc735669da99677ab5561eead86da3d21d11e44";
    sha256 = "sha256-DqLZlmL/ZYtDuHQ+8zS72YMoeFazAeftiauPiqc3Kvw";
  };
  propagatedBuildInputs = with rPackages; [
    ggplot2
    sf
    systemfonts
    scales
    myTextshaping
  ];
  buildInputs = with rPackages; [ R R_utils ];
}

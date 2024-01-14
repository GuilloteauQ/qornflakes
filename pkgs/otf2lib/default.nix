{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "otf2lib";
  version = "3.0.3";
  src = fetchurl {
    url = "https://perftools.pages.jsc.fz-juelich.de/cicd/otf2/tags/otf2-${version}/otf2-${version}.tar.gz";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
  buildInputs = [

  ];
}

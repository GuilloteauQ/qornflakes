{ stdenv, fetchFromGitHub, rPackages, myTextshaping, R }:


rPackages.buildRPackage rec {
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

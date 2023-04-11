{ rPackages, fetchFromGitHub }:

rPackages.buildRPackage rec {
  name = "ggpattern";
  version = "v0.4.2";
  src = fetchFromGitHub {
    owner = "coolbutuseless";
    repo = "ggpattern";
    rev = "8fd649e2d5ef43e348e71a0763d26c5d9ef39533";
    sha256 = "sha256-lRtjJFBzcXCLVyHo+imEOCMQp5BtH5uKALZRD0Wf7+Q=";
  };
  buildInputs = with rPackages; [ R ggplot2 R_utils gridpattern ];
}

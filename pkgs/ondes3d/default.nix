{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "ondes3d";
  version = "2017";
  src = pkgs.fetchgit {
    url = "https://bitbucket.org/fdupros/ondes3d";
    sha256 = "sha256-3qJf5+O6DP5W8bixawnuEk3h9xAHZgc/b1fG8z14JP8=";
  };
  buildInputs = with pkgs; [
    openmpi gnumake
  ];

  postConfigure = ''
    cp ESSAI-XML/options.h SRC/options.h
  '';

  buildPhase = ''
    mkdir -p $out/bin
    cd SRC
    make
    cd ..
    cp ondes3d $out/bin
  '';

  installPhase = ''
    echo "skipping"
  '';
}

{ stdenv, fetchFromGitHub, gnumake, gcc }:

stdenv.mkDerivation rec {
    name = "umka";
    version = "master";
    src = fetchFromGitHub {
        owner = "vtereshkov";
        repo = "umka-lang";
        rev = "84bc220cd099024044e51d08724bd0f5611b84a1";
        sha256 = "sha256-XZVnVSszNGVg75ot1n2vKPbFjh62hHGN5MBzIh97k/s=";
    };
    buildInputs = [
       gnumake
       gcc
    ];
    buildPhase = ''
        mkdir -p $out
        make all PREFIX=$out
    '';
    installPhase = ''
        make install PREFIX=$out
    '';
}

{ stdenv, fetchFromGitHub, cmake }:


stdenv.mkDerivation rec {
    pname = "chuffed";
    version = "ad5c46c9";
    src = fetchFromGitHub {
        repo = pname;
        owner = pname;
        rev = "ad5c46c9ea0ac524583807500a18fc21d8d87504";
        sha256 = "sha256-4euRjg2V3ZRuR4kG29O5gBNoj6Hzll0JF+xs+woD7l8=";
    };
    buildInputs = [
        cmake
    ];
}

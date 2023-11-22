{ stdenv, FetchFromGitHub, cmake }:

stdenv.mkDerivation {
    name = "LB4OMP";
    version = "2022-10-11";
    src = FetchFromGitHub {
        owner = "unibas-dmi-hpc";
        repo = name;
        rev = "00b3ecf8264e6ddc0d0ee277345ba466a4e4ea2f";
        sha256 = "";
    };
    nativeBuildInputs = [
       cmake
    ];
}

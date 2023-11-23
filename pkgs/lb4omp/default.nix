{ stdenv, fetchFromGitHub, cmake, perl, python3Packages, lit, llvmPackages, clang, pkg-config, libelf, libffi }:

stdenv.mkDerivation rec {
    name = "LB4OMP";
    version = "2022-10-11";
    src = fetchFromGitHub {
        owner = "unibas-dmi-hpc";
        repo = name;
        rev = "00b3ecf8264e6ddc0d0ee277345ba466a4e4ea2f";
        sha256 = "sha256-5fe3krt5KMnx0UXAvttUmGx2Ytlfqm64NAeTJ/SVz6g=";
    };
    nativeBuildInputs = [
       cmake
       pkg-config
    ];
    cmakeFlags = [
        "-DCMAKE_C_COMPILER=${clang}/bin/clang"
        "-DCMAKE_CXX_COMPILER=${clang}/bin/clang++"
        # "-DLIBOMP_ARCH=x86_64"
        "-DLIBOMP_HAVE___RDTSC=1"
    ];
    buildInputs = [
        perl
        libelf libffi
        clang
        (python3Packages.python.withPackages (ps: with ps; [
            lit
            filecheck
        ]))
        lit
        llvmPackages.openmp
        llvmPackages.bintools-unwrapped
    ];
}

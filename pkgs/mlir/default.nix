{ stdenv, fetchFromGitHub, cmake, ninja, pkg-config, clang, lld, python3 }:

let

  llvmsrc = fetchFromGitHub {
    owner = "llvm";
    repo = "llvm-project";
    rev = "6d43651b3680e5d16d58296c02b0e7584f1aa7ea";
    sha256 = "sha256-hhraGUKqpVt6vB8tFO6f4X7PSJgI/V4hxb7tgb14eBk=";
  };
in

stdenv.mkDerivation {
  pname = "mlir";
  version = "6d43651";
  src = "${llvmsrc}";

 # sourceRoot = "${src.name}/${targetDir}";
  # cmakeFlags = [
  #   "-DLLVM_ENABLE_PROJECTS=mlir"
  #   "-DCMAKE_C_COMPILER=${clang}/bin/clang"
  #   "-DCMAKE_CXX_COMPILER=${clang}/bin/clang++"
  #   "-DLLVM_ENABLE_LLD=ON"
  # ];

  buildInputs = [
    cmake
    ninja
    clang
    lld
    pkg-config
  ];

  propagatedBuildInputs = [
    python3
  ];

  configurePhase = ''
    mkdir build
    cd build
    cmake -G Ninja ../llvm \
       -DLLVM_ENABLE_PROJECTS=mlir \
       -DLLVM_BUILD_EXAMPLES=ON \
       -DLLVM_TARGETS_TO_BUILD="Native;NVPTX;AMDGPU" \
       -DCMAKE_BUILD_TYPE=Release \
       -DLLVM_ENABLE_ASSERTIONS=ON \
       -DCMAKE_C_COMPILER=${clang}/bin/clang\
       -DCMAKE_CXX_COMPILER=${clang}/bin/clang++\
       -DLLVM_ENABLE_LLD=ON

  '';
}

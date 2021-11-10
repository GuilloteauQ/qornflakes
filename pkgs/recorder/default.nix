{ pkgs }:
with pkgs;
stdenv.mkDerivation {
  name = "Recorder";
  src = fetchFromGitHub {
    owner = "uiuc-hpc";
    repo = "Recorder";
    rev = "c93c5d62b2206ddd19f68335de52c26b0f1b8667";
    sha256 = "sha256-JTJyD9cqPqqfudgaqLquLeg59IQLNwdCBkR8UmYGbN0=";
  };

  buildInputs = [
    openmpi
    coreutils
    cmake
    hdf5
  ];

}

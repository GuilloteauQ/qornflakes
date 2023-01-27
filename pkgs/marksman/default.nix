{ pkgs }:
with pkgs;
stdenv.mkDerivation {
  name = "marksman";
  version = "2022-11-25";
  src = fetchFromGitHub {
    owner = "artempyanykh";
    repo = "marksman";
    rev = version;
    sha256 = "sha256-Q1bYylXE)t+lFnuSqunhpBgxAHBeGVHd3U6RVZLf+n8";
  };
  buildInputs = with rPackages; [ ];
}

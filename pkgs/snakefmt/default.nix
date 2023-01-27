{ pkgs }:
with pkgs;
python3Packages.buildPythonPackage rec {
  pname = "snakefmt";
  version = "v0.8.0";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "snakemake";
    repo = pname;
    rev = version;
    sha256 = "sha256-13rlwEV6PU1U+dhDF5H2jyw9M3y+8LfqHRmuh9twjJg=";
  };

  buildInputs = [ pkgs.python3Packages.poetry ];
  propagatedBuildInputs = with python3Packages; [
    pkgs.python3Packages.click
    pkgs.python3Packages.black
    pkgs.python3Packages.toml
  ];
  doCheck = false;
}

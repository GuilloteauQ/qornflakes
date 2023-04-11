{ python3Packages, fetchFromGitHub }:

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

  buildInputs = [ python3Packages.poetry ];
  propagatedBuildInputs = [
    python3Packages.click
    python3Packages.black
    python3Packages.toml
  ];
  doCheck = false;
}

{ pkgs }:
with pkgs;

rPackages.buildRPackage rec {
  name = "facetscales";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "zeehio";
    repo = "facetscales";
    rev = "b4dcbd6e2ea5c3cec6c0b3d987608da671379186";
    sha256 = "sha256-l/hh+tXj50JgrYFpXdhDC45awNsgVPhGG0xx05+U0ac";
  };
  buildInputs = with rPackages; [ R ggplot2 R_utils ];
}

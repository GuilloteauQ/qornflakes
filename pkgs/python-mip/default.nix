{ pkgs }:
with pkgs;
# setuptools_scm is a pain: https://github.com/NixOS/nixpkgs/issues/41136
python38Packages.buildPythonPackage rec {
  name = "python-mip";
  version = "1.13.0";
  src = pkgs.fetchgit {
    url = "https://github.com/coin-or/python-mip";
    rev = "8a6b983df9bbe53a1e06d30689ed9ca278a0d7d8";
    sha256 = "sha256-hIyxkBPibTZhnZUAIVOqv/sjuixAgA6lnqhOztsUD/I";
    leaveDotGit = true;
  };
  nativeBuildInputs = [ git ];
  propagatedBuildInputs = with python38Packages; [ cffi setuptools_scm ];
  doCheck = false;
}

{ rPackages, fetchFromGitHub }:

rPackages.buildRPackage rec {
  name = "qprez";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "GuilloteauQ";
    repo = "QPrez";
    rev = "023551298eaffa894dba17e41ad201fd6416ffb6";
    sha256 = "sha256-Q1bYylXEot+lFnuSqunhpBgxAHBeGVHd3U6RVZLf+n8";
  };
  buildInputs = with rPackages; [ R rmarkdown knitr R_utils ];
}

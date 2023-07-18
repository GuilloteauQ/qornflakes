{ rPackages, fetchgit, pajeng, R, gnumake }:

rPackages.buildRPackage {
  name = "pajengr";
  version = "master";
  src = fetchgit {
    url = "https://github.com/schnorr/pajengr";
    rev = "dc4af6a2d2f939129717c0e1638e87553be5dc7b";
    sha256 = "sha256-uZe7QTgqB0gkfABWt2xUeHV410DFUPgrhjId+WeLzw4=";
    deepClone = true;
  };
  buildInputs = with rPackages; [
    R
    R_utils
    devtools
    gnumake
  ] ++ pajeng.buildInputs ;

  propagatedBuildInputs = [
    rPackages.Rcpp
  ];
}

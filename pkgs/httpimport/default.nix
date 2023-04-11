{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  name = "httpimport";
  version = "0.7.2";
  src = fetchFromGitHub {
    owner = "operatorequals";
    repo = "httpimport";
    rev = "47786966477c03b12298fd6f23fd8ce9d23b9140";
    sha256 = "sha256-P/R0zd0E3pyWtIGU6UF//TOJdMxUoCKLaVlNn9K8edM";
  };
  doCheck = false;
}

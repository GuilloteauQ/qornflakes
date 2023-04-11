{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  name = "globus-sdk";
  version = "3.1.0";
  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-sdk-python";
    rev = "a346def64ce6b1490ea38aa62b92f884f01552bd";
    sha256 = "sha256-OOF4bHak//YyqeThPgTXh32qNG1X+JKQ8giI9DVOD5Y";
  };
  propagatedBuildInputs = with python3Packages; [
    requests
    cryptography
    pyjwt
    # requests
  ];
  doCheck = false;
}

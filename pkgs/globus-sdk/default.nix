{ pkgs }:
with pkgs;
python38Packages.buildPythonPackage rec {
  name = "globus-sdk";
  version = "3.1.0";
  src = fetchFromGitHub {
    owner = "globus";
    repo = "globus-sdk-python";
    rev = "a346def64ce6b1490ea38aa62b92f884f01552bd";
    sha256 = "sha256-OOF4bHak//YyqeThPgTXh32qNG1X+JKQ8giI9DVOD5Y";
  };
  propagatedBuildInputs = with python38Packages; [
    requests
    cryptography
    pyjwt
    # requests
  ];
  doCheck = false;
}

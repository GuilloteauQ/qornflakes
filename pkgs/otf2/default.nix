{ python3Packages } :

python3Packages.buildPythonPackage rec {
  pname = "otf2";
  version = "3.1rc1";
  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-KUmU3lEPnw7yFqa2drs4tZt9cn3QhV6TEFVt4VH6Zsw=";
  };
  propagatedBuildInputs = [

  ];
}

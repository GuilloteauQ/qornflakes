{ python3Packages } :

python3Packages.buildPythonPackage rec {
  pname = "marimo";
  version = "0.1.76";
  format = "pyproject";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "sha256-uOKd8s0MDSYMR1gf/MzsUQ5sbVl0FtH0I16kMxi94Yc=";
  };

  propagatedBuildInputs = with python3Packages; [
    setuptools

    click
    #importlib_resources
    jedi
    markdown
    pymdown-extensions
    pygments
    tomlkit
    tornado
    #typing_extensions
    black

  ];
  doCheck = false;
}

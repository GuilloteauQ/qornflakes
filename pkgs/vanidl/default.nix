{ pkgs }:
with pkgs;
python38Packages.buildPythonPackage rec {
  name = "vanidl";
  version = "0.0.1";
  src = fetchFromGitHub {
    owner = "hariharan-devarajan";
    repo = "vanidl";
    rev = "16ddc29d7c8d43335c4aed0b75f1854793e43cc6";
    sha256 = "sha256-YpaQveJ6MwM5lljmjm16J51f7/xmEclc46DqVauBKuA";
  };
  preBuild = ''
    sed -i 's#==#>=#g' requirements.txt
    sed -i 's#==#>=#g' setup.cfg
  '';
  propagatedBuildInputs = with python38Packages; [
    pandas
    numpy
    h5py
    tensorflow
  ];
  doCheck = false;
}

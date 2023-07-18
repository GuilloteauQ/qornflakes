{ writeScriptBin, python3, fetchgit, execo }:

let
  src = fetchgit {
    url = "https://github.com/lpouillo/topo5k";
    rev = "50dcc2e9b1f8c5dcdf2a2c7ccfe029f0aef9c59a";
    sha256 = "sha256-6BT4zUzLGpAyQ2yOXLoMDMKDxM0lhSdsDSp6/iICEbY=";
  };
  my-python-packages = ps: [
    execo
    ps.networkx
    ps.requests
  ];
  myPython = python3.withPackages my-python-packages;
in
writeScriptBin "topo5k" ''
  ${myPython}/bin/python3 ${src}/topo5k $@
''

{ buildGoModule, fetchFromGitHub, graphviz, bashInteractive }:

buildGoModule rec {
    pname = "scicommander";
    version = "0.5.0";
    src = fetchFromGitHub {
        owner = "samuell";
        repo = pname;
        rev = version;
        sha256 = "sha256-uZC3j1xXDJT5a3aMRASfwdBQTuOl7k0M/1mq96bg2Fg=";
    };
    vendorHash = null;
    propagateBuildInputs = [
        graphviz
        bashInteractive
    ];
    preBuild = ''
        substituteInPlace cmd/sci/main.go --replace 'dot -Tsvg' '${graphviz}/bin/dot -Tsvg'
    '';
  }

{ pkgs }:
with pkgs;
let
  wirerope = python3Packages.buildPythonPackage rec {
    name = "wirerope";
    version = "0.4.5";
    src = pkgs.fetchgit {
      url = "https://github.com/youknowone/wirerope";
      rev = "81c533d6df479cae80f74b5c298c4236f98f0158";
      sha256 = "sha256-IZOu3JNNd/g19KeaeeJUXr0Ia+n5iffuZqNonfwCG8k=";
      #leaveDotGit = true;
    };
    # nativeBuildInputs = [ git ];
    propagatedBuildInputs = with python3Packages; [
      six
    ];
    doCheck = false;
  };
  ring = python3Packages.buildPythonPackage rec {
    name = "ring";
    version = "0.9.1";
    src = pkgs.fetchgit {
      url = "https://github.com/youknowone/ring";
      rev = "8e4eb90b13d6480e50c63266e041e491c7c41dfe";
      sha256 = "sha256-VmNXfntVFlXmvx9OjZ0VuIlHY5CPS3N+MJlL8YkrKcw=";
      #leaveDotGit = true;
    };
    # nativeBuildInputs = [ git ];
    propagatedBuildInputs = with python3Packages; [
      attrs
      wirerope
    ];
    doCheck = false;
  };

  execo = python3Packages.buildPythonPackage rec {
    pname = "execo";
    version = "2.6.8";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-xkAMVQxAy9zx2P6R8I/Xz7afQJP0c0I8hddrKeEcPF4=";
    };
  };

  jsonschema = python3Packages.buildPythonPackage rec {
    pname = "jsonschema";
    version = "3.0.0";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-rMipDDHREGBRbP0LQUufi89LxpGyHw94bqV91SVceds=";
    };
    doCheck = false;
    propagatedBuildInputs = with python3Packages; [
      setuptools_scm
      pyrsistent
      attrs
    ];
  };


  diskcache = python3Packages.buildPythonPackage rec {
    pname = "diskcache";
    version = "3.1.1";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-9fpqInS8T8LxyIQDT5qxzIOAVEIf9JNSRzL1LMEXT7w=";
    };
    doCheck = false;
    propagatedBuildInputs = with python3Packages; [
      setuptools
    ];
  };

  argparse = python3Packages.buildPythonPackage rec {
    pname = "argparse";
    version = "1.4.0";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-YrCJpVvh2JSc0rx+DfC9254Cj678jDIDjMhIYq791uQ=";
    };
    # doCheck = false;
  };

  ssh-python = python3Packages.buildPythonPackage rec {
    pname = "ssh-python";
    version = "0.10.0";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-ZFlypiAbOGvHs4CQFO4p1JqB0DVCIgqUrPBSykbF+Mg=";
    };
    # We don't want to build with CMake, just include it for the libssh2 bindings.
    dontUseCmakeConfigure = true;
    nativeBuildInputs = [ pkgs.cmake ];

    SYSTEM_LIBSSH2 = "1";
    buildInputs = [ pkgs.libssh2 pkgs.openssl pkgs.zlib ];
  };

 ssh2-python = python3Packages.buildPythonPackage rec {
      pname = "ssh2-python";
      version = "0.27.0";

      src = python3Packages.fetchPypi {
        inherit pname version;
        sha256 = "sha256-plsU/0S3oFzpDHCvDeZE0wwdB+dtrFDfjg19K5QJYjs=";
      };

      # We don't want to build with CMake, just include it for the libssh2 bindings.
      dontUseCmakeConfigure = true;
      nativeBuildInputs = [ pkgs.cmake ];

      SYSTEM_LIBSSH2 = "1";

      buildInputs = [ pkgs.libssh2 pkgs.openssl pkgs.zlib ];
    };

  parallel-ssh = python3Packages.buildPythonPackage rec {
    pname = "parallel-ssh";
    version = "2.10.0";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-i5JfQ5cqVJrgkKVfVXvrU6GWhWZtvrFmswQ9YfXrLbk=";
    };
    # doCheck = false;
    propagatedBuildInputs = [
      python3Packages.gevent
      ssh2-python
      ssh-python
    ];
  };

  iotlabcli = python3Packages.buildPythonPackage rec {
    pname = "iotlabcli";
    version = "3.3.0";
    src = python3Packages.fetchPypi {
      inherit pname version;
      sha256 = "sha256-5IHWTzaRrc9WSLFDWyA7VDkisYoV9ITRpirjbSLPf34=";
    };
    doCheck = false;
    propagatedBuildInputs = [
      python3Packages.requests
      python3Packages.jmespath
    ];
  };

  iotlabsshcli = python3Packages.buildPythonPackage rec {
    pname = "iotlabsshcli";
    version = "1.1.0";
    src = pkgs.fetchgit {
      url = "https://github.com/GuilloteauQ/ssh-cli-tools";
      rev = "bfe257be31941f906539680d3a220c682b9ee5e6";
      sha256 = "sha256-b29z/amJGP/36YKIaZlu2Tdo7oJXSqRT/z3cLIi5TtI=";
      #leaveDotGit = true;
    };
    doCheck = false;
    propagatedBuildInputs = [
      python3Packages.scp
      python3Packages.psutil
      python3Packages.gevent
      parallel-ssh
      iotlabcli
    ];
  };
  
  distem = python3Packages.buildPythonPackage rec {
    pname = "distem";
    version = "0.0.5";
    src = pkgs.fetchgit {
      url = "https://gitlab.inria.fr/myriads-team/python-distem";
      rev = "650931b377c35470e3c72923f9af2fd9c37f0470";
      sha256 = "sha256-brrs350eC+vBzLJmdqw4FnjNbL+NgAfnqWDjsMiEyZ4=";
      #leaveDotGit = true;
    };
    # doCheck = false;
    propagatedBuildInputs = [
      python3Packages.requests
    ];
  };

  python-grid5000 = python3Packages.buildPythonPackage rec {
    pname = "python-grid5000";
    version = "1.1.3";
    src = pkgs.fetchgit {
      url = "https://gitlab.inria.fr/msimonin/python-grid5000";
      rev = "9e7bd87422075a2d6314181f79877930ea43972e";
      sha256 = "sha256-tDmp4/+ty4PtiNTIHnW9aUaXoUivjvDAgXVMg/A91ak=";
      #leaveDotGit = true;
    };
    doCheck = false;
    propagatedBuildInputs = [
      python3Packages.pyyaml
      python3Packages.requests
      python3Packages.ipython
    ];
  };


in
python3Packages.buildPythonPackage rec {
  pname = "enoslib";
  version = "7.2.1";
  # src = python3Packages.fetchPypi {
  #   inherit pname version;
  #   sha256 = "sha256-RMipDDHREGBRbP0LQUufi89LxpGyHw04bqV91SVceds=";
  # };
  src = pkgs.fetchgit {
    url = "https://gitlab.inria.fr/discovery/enoslib";
    rev = "103f6c488c216ccb69b2c034551267b740fad49a";
    sha256 = "sha256-RqE0QRZwgQZAZIazURU+Ox6Uf8mqibyWjZLC69sjdiM=";
    #leaveDotGit = true;
  };
  propagatedBuildInputs = [
    python3Packages.rich
    python3Packages.cryptography
    python3Packages.ansible
    python3Packages.sshtunnel
    python3Packages.python-vagrant

    distem
    iotlabsshcli
    ring
    diskcache
    execo
    jsonschema
    python-grid5000
  ];
  doCheck = false;
}

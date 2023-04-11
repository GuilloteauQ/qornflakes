{ stdenv, bashInteractive, gnumake, gcc, libtool, autoconf, automake, pkg-config, fftw, hwloc}:

stdenv.mkDerivation rec {
  name = "starpu";
  version = "1.4.0";
  src = fetchTarball {
    url = "https://files.inria.fr/starpu/starpu-${version}/starpu-${version}.tar.gz";
    sha256 = "sha256:09h8r9xp4v4haavrrcqixgd8j84bsrsxc0xi3g9lsy18cr6zydyx";
  };
  buildInputs = [
    gnumake
    gcc
    libtool
    autoconf
    automake
    pkg-config
  ];
  propagatedBuildInputs = [
    fftw
    hwloc
  ];
  patchPhase = ''
     substituteInPlace doc/extractHeadline.sh --replace "/bin/bash" "${bashInteractive}/bin/bash"
     substituteInPlace doc/fixLinks.sh --replace "/bin/bash" "${bashInteractive}/bin/bash"
  '';
  
}


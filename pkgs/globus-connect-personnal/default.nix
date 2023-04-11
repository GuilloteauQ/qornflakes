{ tcl, autoPatchelfHook, audit, glibc, gcc-unwrapped, tk, tcllib, tclx }:

tcl.mkTclDerivation {
  name = "globus-connect-personal";
  src = fetchTarball {
    url =
      "https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz";
    sha256 = "1b3q30nc4ay6y1ac3sdzbcckq7gfy3bzhxr5vvamddxgrk7hi4b7";
  };

  nativeBuildInputs =
    [ autoPatchelfHook audit glibc gcc-unwrapped tk tcllib tcl tclx ];
  buildInputs = [ tk tcllib tcl tclx ];

  propagatedBuildInputs = [ tk ];
  buildPhase = ''
    mkdir -p $out/bin
    cp -r * $out
    ln -s $out/globusconnectpersonal $out/bin/globusconnectpersonal
    ln -s $out/globusconnect $out/bin/globusconnect
  '';
  installPhase = ''
    true
  '';

}

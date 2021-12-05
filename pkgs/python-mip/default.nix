{ pkgs }:
with pkgs;
python38Packages.buildPythonPackage rec {
  name = "python-mip";
  version = "1.13.0";
  src = fetchFromGitHub {
    owner = "coin-or";
    repo = "python-mip";
    rev = "8a6b983df9bbe53a1e06d30689ed9ca278a0d7d8";
    sha256 = "sha256-asSs98yGBPL+uK8n0hzL4e8ZKDE0y69Jt4fPf001vRs";
  };
  prePatch = ''
        cat << EOF > setup.py
    import setuptools


    with open("README.md", "r") as fh:
        long_descr = fh.read()

    setuptools.setup(
        name="mip",
        python_requires=">3.6.0",
        author="Santos, H.G. and Toffolo, T.A.M.",
        author_email="haroldo@ufop.edu.br",
        description="Python tools for Modeling and Solving Mixed-Integer Linear \
        Programs (MIPs)",
        long_description=long_descr,
        long_description_content_type="text/markdown",
        keywords=[
            "Optimization",
            "Linear Programming",
            "Integer Programming",
            "Operations Research",
        ],
        url="https://github.com/coin-or/python-mip",
        packages=["mip", "mip.libraries"],
        package_data={
            "mip.libraries": ["*", "*.*", "win64/*", "win64/*.*", "lin64/*", "lin64/*.*",]
        },
        install_requires=["cffi"],
        classifiers=[
            "Programming Language :: Python :: 3",
            "License :: OSI Approved :: Eclipse Public License 2.0 (EPL-2.0)",
            "Operating System :: OS Independent",
        ],
        setup_requires=['setuptools_scm']
        )
    EOF
  '';
  propagatedBuildInputs = with python38Packages; [ cffi setuptools_scm ];
  doCheck = false;
}

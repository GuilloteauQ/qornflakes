from setuptools import setup

setup(
    # Application name:
    name="my_python_app",

    # Version number (initial):
    version="0.1.0",

    # Application author details:
    author="Quentin Guilloteau",
    author_email="Quentin.Guilloteau@inria.fr",

    # Packages
    packages=["app"],

    # Include additional files into the package
    # include_package_data=True,
    entry_points={
        'console_scripts': ['my_python_app=app.my_python_app:main'],
    },

    #
    # license="LICENSE.txt",
    description="My Python app",

    # long_description=open("README.txt").read(),

    # Dependent packages (distributions)
    install_requires=[
        # "beautifulsoup4",
        # "ics",
        # "requests"
    ]
)

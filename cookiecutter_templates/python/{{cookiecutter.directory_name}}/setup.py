from setuptools import setup

setup(
    # Application name:
    name="{{cookiecutter.app_name}}",

    # Version number (initial):
    version="0.1.0",

    # Application author details:
    author="{{cookiecutter.author_name}}",
    author_email="{{cookiecutter.author_email}}",

    # Packages
    packages=["app"],

    # Include additional files into the package
    # include_package_data=True,
    entry_points={
        'console_scripts': ['{{cookiecutter.app_name}}=app.{{cookiecutter.app_name}}:main'],
    },

    #
    # license="LICENSE.txt",
    description="{{cookiecutter.description}}",

    # long_description=open("README.txt").read(),

    # Dependent packages (distributions)
    install_requires=[
        # "beautifulsoup4",
        # "ics",
        # "requests"
    ]
)

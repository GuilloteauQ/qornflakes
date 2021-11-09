# qornflakes
My personnal collection of frequent Nix Flakes

## `nix flake show`

```sh
$ nix flake show github:GuilloteauQ/qornflakes

├───packages
│   └───x86_64-linux
│       ├───cc-flake-test: package 'cookiecutter-template-flake-test'
│       ├───cc-python: package 'cookiecutter-template-python'
│       ├───shell-R: package 'R'
│       ├───shell-julia: package 'julia'
│       ├───shell-lua: package 'lua'
│       └───shell-python: package 'python'
└───templates
    ├───C: template: a simple C template
    ├───R: template: R and friends
    ├───Rmd: template: a RMarkdown template
    ├───md: template: a Markdown + Pandoc template
    └───python: template: a Python3.8 template
```

There are two types of templates:

- Usual Nix Flakes `templates`

- Templates using `cookiecutter`

## Use a Nix template

To create a new folder (`my_python_project` in the example) with the template:

```sh
$ nix flake new -t github:GuilloteauQ/qornflakes#python my_python_project
```

To initialize the current folder:

```sh
$ nix flake init -t github:GuilloteauQ/qornflakes#python
```

## Use a CookieCutter template

Under the hood we are running a shell expression to call `cookiecutter` and this cannot be a simple template from the point of vue of Nix.

Thus for those templates, the syntax is a bit different:

```sh
$ nix run github:GuilloteauQ/qornflakes#cc-python
```

and you will be prompted with the `cookiecutter` interface.

## Register these flakes

```sh
$ nix registry add qorn github:GuilloteauQ/qornflakes
```

Check if it is in the list:

```sh
$ nix registry list
```

We can now use it as simply as:

```sh
$ nix flake new -t qorn#python plop
```

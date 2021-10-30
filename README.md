# qflakes
My personnal collection of frequent Nix Flakes

## `nix flake show`

```sh
$ nix flake show github:GuilloteauQ/qflakes

github:GuilloteauQ/qflakes/1a0f299058999f329df29c07ac896892716db680
└───templates
    ├───R: template: R and friends
    ├───Rmd: template: a RMarkdown template
    ├───md: template: a Markdown + Pandoc template
    └───python: template: a Python3.8 template
```

## Use a template

To create a new folder (`my_python_project` in the example) with the template:

```sh
$ nix flake new -t github:GuilloteauQ/qflakes#python my_python_project
```

To initialize the current folder:

```sh
$ nix flake init -t github:GuilloteauQ/qflakes#python
```

## Register these flakes

```sh
$ nix registry add qflakes github:GuilloteauQ/qflakes
```

Check if it is in the list:

```sh
$ nix registry list
```

We can now use it as simply as:

```sh
$ nix flake new -t qflakes#python plop
```

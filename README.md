# DOTFILES

# Installing the dotfiles

```sh
$ sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply --ssh jvanhare
```


name: helios
channels:
  - conda-forge
  - bioconda
  - defaults
dependencies:
  - pip
  - mamba
  - numpy
  - scipy
  - sympy
  - matplotlib
  - snakemake
  - python=3.9.7
  - cmake=3.21.3
  - gmsh=4.8.4
  - ninja=1.10.2
  - vim=8.2.3423
  - zsh=5.6.2

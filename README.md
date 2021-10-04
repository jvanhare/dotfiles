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



brew


git
git-flow
hdf5-mpi
pandoc
pandoc-crossref
vim
imagemagick
ffmpeg
ninja
clang-format
python
zsh
cmake
gcc
open-mpi
cppcheck
lapack
lcov
font-fira-code




# This is a Spack Environment file.
#
# It describes a set of packages to be installed, along with
# configuration settings.
spack:
  packages:
    all:
      providers:
        mpi: [openmpi]
  specs:

  ### Base environment. ###
  - zsh@5.8
  - vim@8.2.1201
  - cmake@3.18.4
  - ninja@1.10.1
  - gcc@10.2.0
  - lcov@1.15
  - cppcheck@2.1+htmlreport

  ### Python environment. ###
  - python@3.8.6
  - py-pip
  - py-numpy
  - py-scipy
  - py-sympy


  # - py-matplotlib+animation+fonts+latex+movies^harfbuzz+graphite2

  ### HPC environment. ###
  - openmpi@4.0.5
  - netlib-lapack@3.8.0
  - gmsh@4.5.4+hdf5+metis+netgen+oce+openmp+petsc+slepc+tetgen^openmpi@4.0.5^petsc+int64
  - hdf5@1.10.7+hl
  - parmetis@4.0.3+int64
  - scotch@6.0.10+int64

  concretization: together
  view: true
# EOF.
module purge
module load openmpi/4.0.5-gnu831
source $HOME/.spack/ld_gcc_int64/loads
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export F77=/usr/bin/gfortran
export FC=/usr/bin/gfortran


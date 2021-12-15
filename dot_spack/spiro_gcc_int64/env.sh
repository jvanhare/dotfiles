module purge
source $HOME/.spack/spiro_gcc_int64/loads
module load gcc/8.3

export CC=/opt/tools/gcc-8.3/bin/gcc
export CXX=/opt/tools/gcc-8.3/bin/c++
export FC=/opt/tools/gcc-8.3/bin/gfortran

# EOF.


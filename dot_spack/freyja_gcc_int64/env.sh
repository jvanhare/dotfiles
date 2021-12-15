module purge
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $SCRIPT_DIR/loads

export CC=/usr/local/bin/gcc-11
export CXX=/usr/local/bin/g++-11
export F77=/usr/local/bin/gfortran-11
export FC=/usr/local/bin/gfortran-11

# EOF.

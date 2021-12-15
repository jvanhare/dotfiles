module purge
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source $SCRIPT_DIR/loads

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export F77=/usr/bin/gfortran
export FC=/usr/bin/gfortran

# EOF.

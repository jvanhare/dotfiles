### Set freyja's environment. ###

# Working directory and path.
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH

# Get all Python versions in path.
export PATH="$PATH:/usr/local/opt/python@3.7/bin"
export PATH="$PATH:/usr/local/opt/python@3.8/bin"
export PATH="$PATH:/usr/local/opt/python@3.9/bin"

# Python virtualenvs settings
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
workon python@3.9

# MPI configuration
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self

# HDF5 Configuration
export HDF5_DIR=/usr/local/Cellar/hdf5-mpi/1.12.0_1/

# Default compilers
export FC=/usr/local/bin/gfortran-11
export CC=/usr/local/bin/gcc-11
export CXX=/usr/local/bin/g++-11

# Address sanitizer and memory leaks detection
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=/Users/jvanhare/.lsan:print_suppressions=false"

# EOF.

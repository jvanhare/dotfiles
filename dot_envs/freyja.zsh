### Set freyja's environment. ###

# Working directory and path.
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH

# Conda configuration.
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jvanhare/desktop/wkdir/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jvanhare/desktop/wkdir/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/jvanhare/desktop/wkdir/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jvanhare/desktop/wkdir/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup

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

# Aliases.
alias ls="ls -ltrGh"

# EOF.

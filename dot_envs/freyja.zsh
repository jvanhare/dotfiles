### Set freyja's environment. ###

# Working directory and path.
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export SRC=$WKDIR/src

# Python virtualenvs settings
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
workon base

# MPI configuration
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self

# Default compilers
export FC=/usr/local/bin/gfortran-11
export CC=/usr/local/bin/gcc-11
export CC_BASENAME=`basename $CC | awk '{split($0, out, "-"); print toupper(out[1])}'`
export CC_VERSION=`$CC --version | head -n 1 | awk '{print $NF}'`
export CXX=/usr/local/bin/g++-11

# Address sanitizer and memory leaks detection
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=/Users/jvanhare/.lsan:print_suppressions=false"

# Aliases.
alias ls="ls -ltrGh"
alias wkdir="cd $WKDIR"
alias src="cd $SRC"

# OpenMPI install function.
install_openmpi() {
    cd $SRC
    if [[ -d "openmpi-4.1.1" ]]
    then
        rm -fr openmpi-4.1.1
    fi
    wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.1.tar.gz
    tar xzvf openmpi-4.1.1.tar.gz
    cd openmpi-4.1.1
    ./configure --prefix=$WKDIR/spiro
    make -j16 install
    cd $HOME
    rm -fr $SRC/openmpi-4.1.1
}

# EOF.

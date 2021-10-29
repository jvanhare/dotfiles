### Set freyja's environment. ###

# Working directory and path.
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export SRC=$WKDIR/src

# Source spack.
source $WKDIR/spack/share/spack/setup-env.sh

# MPI configuration
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self

# Address sanitizer and memory leaks detection
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=/Users/jvanhare/.lsan:print_suppressions=false"

# Aliases.
alias ls="ls -ltrGh"
alias wkdir="cd $WKDIR"
alias src="cd $SRC"

# EOF.


# Python virtualenvs settings
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# workon base

# Default compilers
# export FC=/usr/local/bin/gfortran-11
# export CC=/usr/local/bin/gcc-11
# export CC_BASENAME=`basename $CC | awk '{split($0, out, "-"); print toupper(out[1])}'`
# export CC_VERSION=`$CC --version | head -n 1 | awk '{print $NF}'`
# export CXX=/usr/local/bin/g++-11
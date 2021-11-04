# Set freyja's environment. ####################################################
# Working directory and path. ##################################################
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export SRC=$WKDIR/src
# Aliases. #####################################################################
alias ls="ls -ltrGh"
# Source poetry and install completions. #######################################
export PATH=$HOME/Library/Python/3.9/bin:$PATH
test ! -d $HOME/.zfunc && mkdir $HOME/.zfunc
fpath+=~/.zfunc
# Source spack. ################################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
# MPI configuration. ###########################################################
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self
# Address sanitizer and memory leaks detection. ################################
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=$HOME/.lsan:print_suppressions=false"
# EOF. #########################################################################

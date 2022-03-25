# Set freyja's environment. ####################################################
# Working directory and path. ##################################################
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export PATH=/Applications/vizir.app/Contents/MacOS:$PATH
export PATH=/Applications/vizir4.app/Contents/MacOS:$PATH
export SRC=$WKDIR/src
# Aliases. #####################################################################
alias ls="ls -ltrGh"
# Source spack and lmod. #######################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
source /usr/local/opt/lmod/init/sh
# MPI configuration. ###########################################################
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self
# Address sanitizer and memory leaks detection. ################################
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=$HOME/.lsan:print_suppressions=false"
# Add llvm to path. ############################################################
export PATH="/usr/local/opt/llvm/bin:$PATH"
# EOF. #########################################################################

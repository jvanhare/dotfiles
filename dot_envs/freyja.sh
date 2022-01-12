# Set freyja's environment. ####################################################
# Working directory and path. ##################################################
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export PATH=/Applications/vizir.app/Contents/MacOS:$PATH
export PATH=/Applications/vizir4.app/Contents/MacOS:$PATH
export SRC=$WKDIR/src
# Source the system's library for Intel compilers. #############################
export MACOSX_DEPLOYMENT_TARGET=11.5
export MACOSX_SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr
export CXXFLAGS=-I$MACOSX_SDK/include
export CFLAGS=-I$MACOSX_SDK/include
export LIBRARY_PATH=$MACOSX_SDK/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$MACOSX_SDK/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$MACOSX_SDK/lib:$DYLD_LIBRARY_PATH
# Aliases. #####################################################################
alias ls="ls -ltrGh"
# Source poetry and install completions. #######################################
export PATH=$HOME/Library/Python/3.9/bin:$PATH
test ! -d $HOME/.zfunc && mkdir $HOME/.zfunc
poetry completions zsh > $HOME/.zfunc/_poetry
fpath+=~/.zfunc
# Source different versions of Python. #########################################
export PATH=/usr/local/opt/python@3.7/bin:$PATH
export PATH=/usr/local/opt/python@3.8/bin:$PATH
# Source spack and lmod. #######################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
source /usr/local/opt/lmod/init/zsh
# MPI configuration. ###########################################################
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self
# Address sanitizer and memory leaks detection. ################################
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=$HOME/.lsan:print_suppressions=false"
# EOF. #########################################################################

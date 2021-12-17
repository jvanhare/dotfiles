# Set WSL Ubuntu's environment. ################################################
# Working directory and path. ##################################################
export WKDIR=$HOME/wkdir
export PATH=$WKDIR/bin:$PATH
export SRC=$WKDIR/src
# Aliases. #####################################################################
alias ls="ls -ltrGh --color=auto"
alias wkdir="cd $WKDIR"
alias src="cd $SRC"
# Source poetry and install completions. #######################################
export PATH=$HOME/.local/bin:$PATH
test ! -d $HOME/.zfunc && mkdir $HOME/.zfunc
poetry completions zsh > $HOME/.zfunc/_poetry
fpath+=~/.zfunc
# Source spack and lmod. #######################################################
# test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
source /usr/share/lmod/lmod/init/zsh
# MPI configuration. ###########################################################
export PMIX_MCA_gds=hash
export OMPI_MCA_btl=vader,self
# Address sanitizer and memory leaks detection. ################################
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=$HOME/.lsan:print_suppressions=false"
# Export proxy for git clone, wget, etc. #######################################
export http_proxy=http://proxy.onera:80
export https_proxy=http://proxy.onera:80
export no_proxy=.onera.net,.onera.fr,.onecert.fr
# EOF. #########################################################################

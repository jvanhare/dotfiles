# Set ONERA's environment. #####################################################
# Purge modules. ###############################################################
module purge
# Working directory and path. ##################################################
export WKDIR=$HOME/wkdir
export SRC=$WKDIR/src
export SCRATH=/scratchm/jvanhare
export VISU=/visu/jvanhare
# Aliases. #####################################################################
alias ls="ls -ltrGh --color=auto"
alias wkdir="cd $WKDIR"
alias src="cd $SRC"
alias scratch="cd $SCRATH"
alias visu="cd $VISU"
# Export proxy for git clone, wget, etc. #######################################
export http_proxy=http://proxy.onera:80
export https_proxy=http://proxy.onera:80
export no_proxy=.onera.net,.onera.fr,.onecert.fr
# EOF. #########################################################################

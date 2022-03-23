# Set ONERA's environment. #####################################################
# Purge modules. ###############################################################
module purge
# Working directory and path. ##################################################
export WKDIR=/stck/$USER/wkdir
export SRC=$WKDIR/src
export SCRATCH=/scratchm/$USER
export VISU=/visu/$USER
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

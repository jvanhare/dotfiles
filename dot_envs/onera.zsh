### Set ONERA's environment. ###

# Purge modules.
module purge

# Working directory and path.
export VISU=/visu/jvanhare
export WKDIR=/stck/jvanhare/wkdir
export SCRATH=/scratchm/jvanhare
export SRC=$WKDIR/src

# Aliases.
alias ls="ls -ltrGh --color=auto"
alias visu="cd $VISU"
alias wkdir="cd $WKDIR"
alias scratch="cd $SCRATH"

# Export proxy for git clone, wget, etc.
export http_proxy=proxy.onera:80
export https_proxy=proxy.onera:80
export no_proxy=.onera.net,.onera.fr,.onecert.fr

# EOF.

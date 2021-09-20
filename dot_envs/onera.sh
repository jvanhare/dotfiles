### Set ONERA's environment. ###

# Purge modules.
module purge

# Working directory and path.
export PATH=$WKDIR/bin:$PATH
export WKDIR=/stck/jvanhare
export VISU=/visu/jvanhare
export SCRATH=/scratchm/jvanhare

# Aliases.
alias wkdir="cd $WKDIR"
alias visu="cd $VISU"
alias scratch="cd $SCRATH"

# Export proxy for git clone, wget, etc.
export http_proxy=proxy.onera:80
export https_proxy=proxy.onera:80
export no_proxy=.onera.net,.onera.fr,.onecert.fr

# EOF.

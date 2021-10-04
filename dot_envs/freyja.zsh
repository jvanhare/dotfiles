### Set freyja's environment. ###

# Working directory and path.
export WKDIR=$HOME/Desktop/wkdir
export PATH=$WKDIR/bin:$PATH
export SRC=$WKDIR/src

# Python virtualenvs settings
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
workon base

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

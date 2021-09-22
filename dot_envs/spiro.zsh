### Set spiro's environment. ###

# Get ONERA's environment.
source $HOME/.envs/onera.zsh

# Path configuration.
export PATH=$WKDIR/spiro/bin:$PATH
export PATH=$WKDIR/spiro/conda/envs/helios/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH

# Conda configuration.
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/stck/jvanhare/wkdir/spiro/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/stck/jvanhare/wkdir/spiro/conda/etc/profile.d/conda.sh" ]; then
        . "/stck/jvanhare/wkdir/spiro/conda/etc/profile.d/conda.sh"
    else
        export PATH="stck/jvanhare/wkdir/spiro/conda/bin:$PATH"
    fi
fi
unset __conda_setup

# EOF.

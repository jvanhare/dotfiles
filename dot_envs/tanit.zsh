
### Set tanit's environment. ###

# Get ONERA's environment.
source $HOME/.envs/onera.zsh

# Path configuration.
source /etc/profile.d/modules.sh
export PATH=$WKDIR/tanit/bin:$PATH
export PATH=$WKDIR/tanit/cmake-3.21.0-rc2/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/tanit/lib:$LD_LIBRARY_PATH

# EOF.

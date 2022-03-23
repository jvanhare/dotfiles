# Set spiro's environment. #####################################################
# Get ONERA's environment. #####################################################
source $HOME/.envs/onera.sh
# Path configuration. ##########################################################
export PATH=$WKDIR/spiro/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH
# Source spack. ################################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
# EOF. #########################################################################

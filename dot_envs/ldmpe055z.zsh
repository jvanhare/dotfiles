# Set ldmpe055z's environment. #################################################
# Get ONERA's environment. #####################################################
source $HOME/.envs/onera.zsh
# Path configuration. ##########################################################
export PATH=$WKDIR/ldmpe055z/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$WKDIR/ldmpe055z/bin/vizir4_centos.2021.07.06:$PATH
export LD_LIBRARY_PATH=$WKDIR/ldmpe055z/lib:$LD_LIBRARY_PATH
# Source spack. ################################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
# Aliases. #####################################################################
alias code="/opt/tools/vscode/1.60.0/bin/vscode.sh"
# EOF. #########################################################################

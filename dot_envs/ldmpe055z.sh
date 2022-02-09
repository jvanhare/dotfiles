# Set ldmpe055z's environment. #################################################
# Get ONERA's environment. #####################################################
source $HOME/.envs/onera.sh
# Path configuration. ##########################################################
export PATH=$WKDIR/ldmpe055z/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/ldmpe055z/lib:$LD_LIBRARY_PATH
# Source spack. ################################################################
test -d $SRC/spack && source $SRC/spack/share/spack/setup-env.sh
# Aliases. #####################################################################
alias code="/opt/tools/vscode/1.60.0/bin/vscode.sh"
# Address sanitizer and memory leaks detection. ################################
export ASAN_OPTIONS="detect_leaks=1"
export LSAN_OPTIONS="suppressions=$HOME/.lsan:print_suppressions=false:fast_unwind_on_malloc=false"
# EOF. #########################################################################

# Set spiro's environment. #####################################################
# Get ONERA's environment. #####################################################
source $HOME/.envs/onera.zsh
# Path configuration. ##########################################################
export PATH=$WKDIR/spiro/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH
# ZSH install function. ########################################################
install_zsh() {
    cd $SRC
    if [[ -d "zsh" ]]
    then
        rm -fr zsh
    fi
    git clone https://github.com/zsh-users/zsh.git
    cd zsh
    git checkout zsh-5.8
    ./Util/preconfig
    ./configure --prefix=$WKDIR/spiro
    make -j48 install
    cd $HOME
    rm -fr $SRC/zsh
}
# EOF. #########################################################################



# # Development environments.
# source_dev_intel_19_0_2() {
#     # Modules settings.
#     module purge
#     module load impi/19
#     module load intel/19.0.2
#     module load python/3.7.4-intel-19
#     module load hdf5/1.10.5-intel-19.impi-19
#     # Python virtualenvs settings.
#     export WORKON_HOME=$HOME/.virtualenvs
#     export VIRTUALENVWRAPPER_PYTHON=python3
#     source $HOME/.local/bin/virtualenvwrapper.sh
#     workon base
# }

# # CEDRE environments.
# source_cedre_dev_intel_19_0_2() {
#     source_dev_intel_19_0_2
#     export PDM_DIR=$WKDIR/spiro
#     export PCEDRE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE
#     export CL_LICENSE_FILE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/PRIVE/CLE_CEDRE
#     export CEDRE_CLE_PATH=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/CEDRE/LIBRAIRIES/LIBCLE/MOLOCH/libcle.a
# }

# source_cedre_8_1_0_3() {
#     module purge
#     module use /stck/cedre/module/chaine_cedre
#     module load cedre/8.1.0.3/intel17_impi17
# }




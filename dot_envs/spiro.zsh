### Set spiro's environment. ###

# Get ONERA's environment.
source $HOME/.envs/onera.zsh

# Path configuration.
export PATH=$WKDIR/spiro/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH

# Development environments.
source_dev_intel_19_0_2() {
    # Modules settings.
    module purge
    module load intel/19.0.2
    module load impi/19
    module load python/3.7.4-intel-19
    module load hdf5/1.10.5-intel-19.impi-19
    module load gdb/9.2
    module load cgns/3.2.1-intel-19
    # Python virtualenvs settings.
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=python3
    source $HOME/.local/bin/virtualenvwrapper.sh
    workon base
}

# CEDRE environments.
source_cedre_dev_intel_19_0_2() {
    source_dev_intel_19_0_2
    export PDM_DIR=$WKDIR/spiro
    export PCEDRE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE
    export CL_LICENSE_FILE=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/PRIVE/CLE_CEDRE
    export CEDRE_CLE_PATH=$HOME/ccm_wa/cedre/P_CEDRE~$USER/P_CEDRE/CEDRE/LIBRAIRIES/LIBCLE/MOLOCH/libcle.a
    # Add precompiled explore.
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/stck/cedre/installations/cedre/x86_64/8.1.0.3/intel17_impi17/lib
    alias explore="/stck/cedre/installations/cedre/x86_64/8.1.0.3/intel17_impi17/bin/explore"
}

source_cedre_8_1_0_3() {
    module purge
    module use /stck/cedre/module/chaine_cedre
    module load cedre/8.1.0.3/intel17_impi17
}

# ZSH install function.
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

# Vim install function.
install_vim() {
    cd $SRC
    if [[ -d "vim" ]]
    then
        rm -fr vim
    fi
    git clone https://github.com/vim/vim.git
    cd vim/src
    git checkout v8.2.3451
    ./configure --prefix=$WKDIR/spiro
    make -j48 install
    cd $HOME
    rm -fr $SRC/vim
}

# CMake install function.
install_cmake() {
    cd $SRC
    if [[ -d "cmake-3.21.3" ]]
    then
        rm -fr cmake-3.21.3
    fi
    wget https://github.com/Kitware/CMake/releases/download/v3.21.3/cmake-3.21.3.tar.gz
    tar xzvf cmake-3.21.3.tar.gz
    rm cmake-3.21.3.tar.gz
    cd cmake-3.21.3
    ./bootstrap --prefix=$WKDIR/spiro
    make -j48 install
    cd $HOME
    rm -fr $SRC/cmake-3.21.3
}

# Ninja install function.
install_ninja() {
    cd $WKDIR/spiro/bin
    wget https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
    unzip ninja-linux.zip
    rm ninja-linux.zip
    cd $HOME
}

# Git Flow install function.
install_gitflow() {
    cd $SRC
    if [[ -d "gitflow" ]]
    then
        rm -fr gitflow
    fi
    wget -q  https://raw.githubusercontent.com/petervanderdoes/gitflow-avh/develop/contrib/gitflow-installer.sh
    PREFIX=$WKDIR/spiro bash gitflow-installer.sh install stable
    rm -fr gitflow-installer.sh gitflow
    cd $HOME
}

# EOF.

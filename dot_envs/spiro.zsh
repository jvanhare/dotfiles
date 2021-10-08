### Set spiro's environment. ###

# Get ONERA's environment.
source $HOME/.envs/onera.zsh

# Path configuration.
export PATH=$WKDIR/spiro/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH

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
intall_gitflow() {
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

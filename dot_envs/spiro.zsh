### Set spiro's environment. ###

# Get ONERA's environment.
source $HOME/.envs/onera.zsh

# Path configuration.
export PATH=$WKDIR/spiro/bin:$PATH
export LD_LIBRARY_PATH=$WKDIR/spiro/lib:$LD_LIBRARY_PATH

# ZSH install script. ###
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
    cd ..
    rm -fr zsh
}

# EOF.

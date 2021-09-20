### Install ZSH. ###
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

### Install Vim. ###
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

### Install CMake. ###
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

### Install re2c. ###
cd $SRC
if [[ -d "re2c-2.2" ]]
then
    rm -fr re2c-2.2
fi
wget https://github.com/skvadrik/re2c/archive/refs/tags/2.2.tar.gz
tar xzvf 2.2.tar.gz
rm 2.2.tar.gz
cd re2c-2.2
autoreconf -i -W all
./configure --prefix=$WKDIR/spiro
make -j48 install

### Install ninja. ###
cd $SRC
if [[ -d "ninja" ]]
then
    rm -fr ninja
fi
git clone https://github.com/ninja-build/ninja.git
cd ninja
python configure.py --bootstrap
cp ninja $WKDIR/spiro/bin

# EOF.

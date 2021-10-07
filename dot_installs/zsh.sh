### ZSH install script. ###
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
### EOF. ###

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

# EOF.

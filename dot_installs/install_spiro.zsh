# Install Vim.
cd $SRC
git clone https://github.com/vim/vim.git
cd vim/src
git checkout v8.2.3451
./configure --prefix=$WKDIR/spiro
make -j48 install
# Install i3
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
sudo apt install ./keyring.deb
sudo sh -c 'echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list.d/sur5r-i3.list'
sudo apt update
sudo apt install i3

# Install vim8
# Build vim8 from git
sudo apt -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-0-dev libperl-dev

sudo apt-get remove vim-tiny vim-common vim-gui-common vim-nox
cd ~/mydata/git/
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-x \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim80
# Make deb package and install it
sudo checkinstall --pkgname vim8installdeb --default
_
## Install plugins for Vim {
    # vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo '---------------------- vim plugins ---------------------'
    proxychains4 vim +PlugInstall +qall

    echo '---------------------- ropevim ---------------------'
    cd ~/.vim/bundle/ropevim
    sudo python setup.py install
    cd ~

    echo '---------------------- ctags for tagbar ---------------------'
    sudo apt -y install exuberant-ctags
## }


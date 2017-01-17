## Install oh-my-zsh plugin {
    proxychains4 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## }

## Clone dotfiles from Git {
    git clone --no-checkout https://github.com/blurm/myconfigs
    cd myconfigs
    git config core.worktree "../../"
    git reset --hard origin/master
    cd ~

    # Install plugins for Vim
    vim +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    sudo ./install.py
## }

## Make dir for mounting {
    mkdir mydata
    mkdir mydata-p
## }

## VirtualBox {
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" >> /etc/apt/sources.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt -y install dkms
#sudo apt -y install virtualbox-5.1
## }

#!/bin/bash

## Install oh-my-zsh plugin {
    echo '---------------------- zsh-syntax-highlighting ---------------------'
    proxychains4 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## }

## Clone dotfiles from Git {
    echo '---------------------- myconfigs ---------------------'
    proxychains4 git clone --no-checkout https://github.com/blurm/myconfigs ~/myconfigs
    cd ~/myconfigs
    git config core.worktree "../../"
    git reset --hard origin/master
    # Using SSL
    git remote set-url origin git@github.com:blurm/myconfigs.git
    # Generate new SSL key
    ssh-keygen -t rsa -b 4096 -C "blurm@126.com"
    xclip -sel clip < ~/.ssh/id_rsa.pub
    cd ~

    # Install plugins for Vim
    echo '---------------------- vim plugins ---------------------'
    proxychains4 vim +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    echo '---------------------- YouCompleteMe ---------------------'
    sudo ./install.py
## }

## Make dir for mounting {
    #mkdir mydata
    mkdir -v mydata-p
## }

## VirtualBox {
echo '---------------------- virtualbox ---------------------'
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -c -s) contrib" >> /etc/apt/sources.list'
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt -y install dkms
# virtualbox 5.1 has bug for i3 right now (auto resize doesn't work properly)
sudo apt -y install virtualbox-5.0
# Needed by 5.0 extension package install.
sudo apt -y install gksu
# Need to re-login
sudo usermod -aG vboxusers damon
## }

echo '---------------------- gnome terminal settings ---------------------'
## Restore gnome terminal profile {
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1}
    gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
    gsettings set org.gnome.nautilus.preferences default-sort-order 'modification_date'
    gsettings set org.gnome.nautilus.list-view default-zoom-level 'standard'

    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        use-theme-colors false

    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        background-color "#262626"

    #gsettings set \
        #org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        #scrollback-unlimited true

    # Text color in Profile
    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        foreground-color "#D3D7CF"

    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        use-transparent-background true

    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        background-transparency-percent "10"

    gsettings set \
        org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/ \
        palette "['rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(54,118,190)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)', 'rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)']"
## }

## Default program selection {
    cat /usr/share/applications/defaults.list | grep video >> ~/.local/share/applications/mimeapps.list
    sed -i "s/org.gnome.Totem.desktop/smplayer.desktop/g" ~/.local/share/applications/mimeapps.list
## }

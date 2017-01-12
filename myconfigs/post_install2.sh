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

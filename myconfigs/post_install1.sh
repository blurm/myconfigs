#!/bin/bash

##########################################
# System install script for ubuntu 16.04 #
##########################################

### 删除无用程序

### 添加国内软件源
sudo apt update
#sudo apt upgrade
#sleep 5

### 安装软件
## 设置软件安装环境
echo '------------ Installing Building environment -------------'
sudo apt -y install build-essential cmake
sudo apt -y install python-dev python3-dev
sudo apt -y install python-pip
sudo pip install --upgrade pip
sudo apt -y install git

## 安装网络相关 {
    # Shadowsocks
    echo '----------------- Shadowsocks -------------------'
    sudo apt -y install shadowsocks
    # Shadowsocks config
    #(
        #echo '$a';
        #echo '{';
        #echo '    "server":"52.78.108.174",';
        #echo '    "server_port":8989,';
        #echo '    "local_port":1080,';
        #echo '    "password":"teddysun.com",';
        #echo '    "timeout":600,';
        #echo '    "method":"aes-256-cfb"';
        #echo '}';
        #echo '.';
        #echo 'wq'
    #) | ed -s ~/.config/shadowsocks.json

    # proxychains-ng 在终端环境使用shadowsocks翻墙
    git clone https://github.com/rofl0r/proxychains-ng.git
    cd proxychains-ng
    ./configure --prefix=/usr --sysconfdir=/etc
    make
    sudo make install
    sudo make install-config
    mkdir ~/.proxychains
    cp  /etc/proxychains.conf ~/.proxychains
    sudo sed -i -e 's/^socks4.*$/socks5 127.0.0.1 1080/g' ~/.proxychains/proxychains.conf
    cd ~
    rm -rf proxychains-ng
## }

## Web Tools {
    echo '----------------- Web Tools -------------------'
    # Need to start shadowsocks first to use proxychains
    # 需要把shadowsocks.json提前从mydata/backup/sys_install_backup中拷贝过来
    cp ~/mydata/backup/sys_install_backup/shadowsocks.json ~/myconfigs
    gnome-terminal -x sslocal -c ~/myconfigs/shadowsocks.json
    sleep 5

    # wget -O - 表示将下载内容写入标准输出，不保存在任何文件当中
    proxychains4 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    proxychains4 sudo apt update
    proxychains4 sudo apt -y install google-chrome-stable

    ## chromium-browser
    sudo apt -y install chromium-browser
## }

## sogou input (Need to download manually)

## SendAnyWhere 多平台文件传输
#sudo apt -y install sendanywhere

## System tools {
    echo '----------------- System Tools -------------------'
    sudo apt -y install samba
    sudo apt -y install unity-tweak-tool
    sudo apt -y install gnome-tweak-tool
    sudo apt -y install bleachbit

    # Psensor 检查CPU温度
    sudo apt -y install lm-sensors hddtemp
    ## 检测硬件传感器
    #sudo sensors-detect
    #sensors
    sudo apt -y install psensor

    # Logitech mouse
    sudo apt -y install xbindkeys

    # Partition Tools
    sudo apt -y install gparted

    # See system info from cli
    sudo add-apt-repository ppa:dawidd0811/neofetch
    sudo apt update && sudo apt -y install neofetch

    # Copy to Or paste to X clipboard
    sudo apt -y install xclip
## }

## 系统美化 {
    echo '----------------- Themes & Icons -------------------'
    # Papirus
    wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home-gtk.sh | sh

    # Arc Theme
    sudo sh -c 'echo "deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /" >> /etc/apt/sources.list.d/arc-theme.list'
    wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
    sudo apt-key add - < Release.key
    sudo apt update
    echo '---------------- Start install arc theme -----------------'
    sudo apt install arc-theme
    echo '---------------- End install arc theme -----------------'
    rm Release.key

    echo '----------------------- fonts ---------------------------'
    # TODO 安装字体(i3,awesome font)
    mkdir -p .local/share/fonts
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mv PowerlineSymbols.otf ~/.local/share/fonts/
    fc-cache -vf ~/.local/share/fonts
    mkdir -p ~/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    # fontawesome-web
    cp ~/mydata/backup/sys_install_backup/fontawesome-webfont.ttf ~/.local/share/fonts
## }

## Media
sudo apt -y install smplayer

## i3wm {
    echo '----------------- i3wm -------------------'
    # 程序启动接口
    sudo apt -y install rofi
    # 美化系统，类似Unity-tweak-tools，在这里修改theme
    sudo apt -y install lxappearance
    # 更换桌面壁纸
    #sudo apt -y install feh
    # Nitrogen支持多显示器壁纸设置
    git clone git@github.com:l3ib/nitrogen.git
    cd nitrongen
    sudo apt -y install dh-autoreconf
    sudo apt -y install libgtk2.0-dev
    sudo apt -y install libgtkmm-2.4-dev
    ./configure
    make
    sudo make install
    cd ..
    rm -rf nitrogen
    # i3-wm
    echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
    sudo apt update
    sudo apt --allow-unauthenticated -y install sur5r-keyring
    sudo apt update
    sudo apt -y install i3
    # 系统状态栏，用来取代i3status
    sudo apt -y install i3blocks
    # 去掉Nautilus默认启动桌面
    gsettings set org.gnome.desktop.background show-desktop-icons false
## }

## Developing tools {
    echo '----------------- Developing Tools -------------------'
    # Vim
    sudo apt -y remove vim-tiny
    sudo apt -y install vim-gnome
    # Python2 support for Vim (Used by some plugins like ropevim)
    sudo apt -y install vim-gnome-py2
    # Vim plugin - Vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Java
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    sudo apt -y install oracle-java8-installer

    # Eclipse (need to install manually)

    # Python
    # 语音程序
    sudo apt -y install espeak
    # GSM Model接口
    sudo apt -y install minicom

    sudo pip install flake8
    sudo pip install rope
    sudo pip install ropemode

    sudo pip install requests
    sudo pip install selenium
    sudo apt -y install phantomjs


    # nodejs
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    sudo apt -y install nodejs
    sudo npm install -g jshint;
## }

## Terminal Tools {
## Need to put it at last, since chsh will interrupt the install process
    echo '--------------------- Terminal Tools ----------------------------'
    # Zsh
    sudo apt -y install zsh
    # on my zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
## }

#!/bin/bash

##########################################
# System install script for ubuntu 18.04 #
##########################################

### 删除无用程序


mkdir -p ~/mydata/git

### 安装软件
## 设置软件安装环境
echo '------------ Installing Building environment -------------'
echo '------------ build-essential, cmake -------------'
sudo apt -y install build-essential cmake autoconf
echo '------------ python-dev, pythone3-dev -------------'
sudo apt -y install python-dev python3-dev
echo '------------ python-pip -------------'
sudo apt -y install python-pip
sudo apt -y install python3-pip
# upgrade pip with tsinghua mirror
sudo -H pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U

#mkdir ~/.pip
#cd ~/.pip
## -e enable interpretation of backslash escapes
#echo -e '[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple' >> pip.conf
#sudo -H pip install pip -U
#sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


echo '------------ git -------------'
sudo apt -y install git
git config --global user.name "damon"
git config --global user.email "blurm@126.com"
echo '------------ curl -------------'
sudo apt -y install curl

## 安装网络相关 {
    # Shadowsocks
    echo '----------------- Shadowsocks -------------------'
    #sudo -H pip install shadowsocks
    # 使用chacha20加密shadowsocks通信，需要安装libsodium
    #sudo apt -y install python-m2crypto
    #wget https://github.com/jedisct1/libsodium/releases/download/1.0.11/libsodium-1.0.11.tar.gz
    #tar xf libsodium-1.0.11.tar.gz && cd libsodium-1.0.11
    #sudo ./configure
    #sudo make
    #sudo make install
    #sudo ldconfig
    #sudo rm -rvf libsodium*

    # 优化文件描述符
    echo '* soft nofile 51200' >> /etc/security/limits.conf
    echo '* hard nofile 51200' >> /etc/security/limits.conf
    ulimit -n 51200
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
    echo '----------------- proxychains-ng -------------------'
    #cd ~/mydata/git
    #git clone https://github.com/rofl0r/proxychains-ng.git
    #cd proxychains-ng
    #./configure --prefix=/usr --sysconfdir=/etc
    #make
    #sudo make install
    #sudo make install-config
    #mkdir -v ~/.proxychains
    #cp -v /etc/proxychains.conf ~/.proxychains
    #sudo sed -i -e 's/^socks4.*$/socks5 127.0.0.1 1080/g' ~/.proxychains/proxychains.conf
## }

## Web Tools {
    #echo '----------------- Web Tools -------------------'
    # Need to start shadowsocks first to use proxychains
    #gnome-terminal -x sslocal -c ~/mydata/backup/sys_install_backup/shadowsocks.json
    #sleep 5

    # wget -O - 表示将下载内容写入标准输出，不保存在任何文件当中
    echo '----------------- google-chrome -------------------'
    #proxychains4 wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo apt update
    sudo apt -y install google-chrome-stable

    ## chromium-browser
    echo '----------------- chromium-browser -------------------'
    sudo apt -y install chromium-browser
    echo '----------------- adobe flash plugin -------------------'
    sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
    sudo apt update
    sudo apt -y upgrade
    sudo apt -y install adobe-flashplugin
## }

#echo '------------------------ calibre ------------------------------'
# Dowloading is too slow, manually install
#sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

## sogou input (Need to download manually)

## SendAnyWhere 多平台文件传输
#sudo apt -y install sendanywhere

## System tools {
    echo '----------------- System Tools -------------------'
    echo '----------------- htop -------------------'
    sudo apt -y install htop
    echo '----------------- Input Methods -------------------'
    sudo apt -y install fcitx-googlepinyin fcitx-sunpinyin
    echo '----------------- unrar -------------------'
    sudo apt -y install unrar
    echo '----------------- ppa-purge -------------------'
    sudo apt -y install ppa-purge -y
    echo '----------------- Ranger (file manager)-------------------'
    sudo -H pip install ranger-fm
    #cd ~/mydata/git
    #git clone https://github.com/ranger/ranger.git
    #cd ranger
    #sudo make install
    #cp install_log.txt ~/mydata/backup/sys_install_backup/ranger_install_log.txt
    #ranger --copy-config=all
    # Preview softwares
    sudo apt -y install w3m-img
    sudo apt -y install atool
    sudo apt -y install highlight
    sudo apt -y install mediainfo
    sudo apt -y install xsel
    echo '----------------- samba -------------------'
    sudo apt -y install samba
    echo '----------------- minidlna -------------------'
    sudo apt -y install minidlna
    # Check gnome terminal profile values
    echo '----------------- dconf-editor -------------------'
    sudo apt -y install dconf-editor
    #echo '----------------- unity-tweak-tool -------------------'
    #sudo apt -y install unity-tweak-tool
    echo '----------------- gnome-tweak-tool -------------------'
    sudo apt -y install gnome-tweak-tool
    # System Cleaning
    echo '----------------- bleachbit -------------------'
    sudo apt -y install bleachbit

    # Psensor 检查CPU温度
    echo '----------------- lm-sensors, hddtemp -------------------'
    sudo apt -y install lm-sensors hddtemp
    ## 检测硬件传感器
    #sudo sensors-detect
    #sensors
    echo '----------------- psensor -------------------'
    sudo apt -y install psensor

    # Logitech mouse
    echo '----------------- xbindkeys -------------------'
    sudo apt -y install xbindkeys

    # Partition Tools
    echo '----------------- gparted -------------------'
    sudo apt -y install gparted

    # See system info from cli
    echo '----------------- neofetch -------------------'
    #sudo add-apt-repository ppa:dawidd0811/neofetch
    #sudo apt update && sudo apt -y install neofetch

    # Copy to Or paste to X clipboard
    echo '----------------- xclip -------------------'
    sudo apt -y install xclip
## }

## 系统美化 {
    echo '----------------- Themes & Icons -------------------'
    echo '----------------- papirus -------------------'
    # Papirus
    sudo add-apt-repository ppa:papirus/papirus -y
    sudo apt-get update
    sudo apt-get install papirus-icon-theme

    # Arc Theme
    #sudo sh -c 'echo "deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /" >> /etc/apt/sources.list.d/arc-theme.list'
    #wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
    #sudo apt-key add - < Release.key
    #sudo apt update
    echo '---------------- arc theme -----------------'
    sudo apt -y install arc-theme
    #rm -v Release.key

    echo '----------------------- fonts ---------------------------'
    # TODO 安装字体(i3,awesome font)
    echo '----------------------- powerline ---------------------------'
    #proxychains4 wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    #proxychains4 wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    #wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    #wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    #mkdir -vp ~/.local/share/fonts
    #mv -v PowerlineSymbols.otf ~/.local/share/fonts/
    #mkdir -vp ~/.config/fontconfig/conf.d/
    #mv -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

    sudo apt -y install fonts-powerline
    #cd ~/mydata/git
    #proxychains4 git clone https://github.com/powerline/fonts.git
    #git clone https://github.com/powerline/fonts.git
    #cd -v fonts
    #./install.sh

    # fontawesome-web (install manully)
## }

## Entertainment
    echo '----------------------- smplayer ---------------------------'
    sudo apt -y install smplayer
    echo '----------------------- kodi ---------------------------'
    sudo add-apt-repository ppa:team-xbmc/ppa -y
    sudo apt update
    sudo apt -y install kodi

## Photo & Media
    echo '----------------------- Darktable ---------------------------'
    sudo add-apt-repository ppa:pmjdebruijn/darktable-release -y
    sudo apt update
    sudo apt -y install darktable

## i3wm {
    echo '----------------------- rofi ---------------------------'
    sudo apt -y install rofi
    # 美化系统，类似Unity-tweak-tools，在这里修改theme
    echo '----------------------- lxappearance ---------------------------'
    sudo apt -y install lxappearance
    # 更换桌面壁纸
    #sudo apt -y install feh
    # Nitrogen支持多显示器壁纸设置
    #echo '----------------------- nitrogen ---------------------------'
    #cd ~/mydata/git
    #proxychains4 git clone git@github.com:l3ib/nitrogen.git
    #cd -v nitrongen
    #echo '----------------------- nitrogen dh-autoreconf ---------------------------'
    #sudo apt -y install dh-autoreconf
    #echo '----------------------- nitrogen libgtk2.0-dev ---------------------------'
    #sudo apt -y install libgtk2.0-dev
    #echo '----------------------- nitrogen libgtkmm ---------------------------'
    #sudo apt -y install libgtkmm-2.4-dev
    #./configure
    #make
    #sudo make install

    # i3-wm
    echo '----------------------- i3wm ---------------------------'
    #echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
    #sudo apt update
    #sudo apt --allow-unauthenticated -y install sur5r-keyring
    #sudo apt update
    #sudo apt -y install i3
    sudo /usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
    sudo dpkg -i ./keyring.deb
    echo "deb https://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee -a /etc/apt/sources.list.d/sur5r-i3.list
    sudo apt update
    sudo apt -y install i3

    # 系统状态栏，用来取代i3status
    echo '----------------------- i3blocks --------------------------'
    cd ~/mydata/git
    git clone https://github.com/vivien/i3blocks
    cd i3blocks
    ./autogen.sh
    ./configure
    make
    sudo make install
    #sudo apt -y install i3blocks
    # 去掉Nautilus默认启动桌面
    gsettings set org.gnome.desktop.background show-desktop-icons false
## }

## Downloading Tools {
    echo '----------------------- uget ---------------------------'
    sudo add-apt-repository ppa:plushuang-tw/uget-stable -y
    sudo apt -y install uget
    # Also need to install uGet Integration extension in Chrome
    sudo add-apt-repository ppa:slgobinath/uget-chrome-wrapper -y
    sudo apt install uget-chrome-wrapper
    echo '----------------------- aria2 ---------------------------'
    #sudo add-apt-repository ppa:t-tujikawa/ppa -y
    sudo apt -y install aria2
## }

## Developing tools {
    echo '----------------- Developing Tools -------------------'
    # Vim
    #echo '----------------------- vim ---------------------------'
    #sudo apt -y remove vim-tiny
    #sudo apt -y install vim-gnome
    ## Python2 support for Vim (Used by some plugins like ropevim)
    #sudo apt -y install vim-gnome-py2
    ## Vim plugin - Vundle
    #proxychains4 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # Java (The PPA was discontinued, need to install manually)
    # Eclipse (need to install manually)

    # Python
    # 语音程序
    echo '----------------------- Python components ---------------------------'
    sudo apt -y install espeak
    # GSM Model接口
    sudo apt -y install minicom

    # Plugins for Python2
    sudo -H pip install -i https://pypi.tuna.tsinghua.edu.cn/simple flake8 rope ropemode requests selenium pyquery beautifulsoup4 jedi autopep8 yapf
    sudo apt -y install phantomjs
    sudo -H pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pyquery

    # nodejs
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt -y install nodejs
    # Error and problem detecting tool for Vim
    sudo npm install -g jshint
    sudo npm install -g tern
## }

## Terminal Tools {
    ## Need to put it at last, since chsh will interrupt the install process
    echo '--------------------- zsh ----------------------------'
    # Zsh
    sudo apt -y install zsh
    # on my zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## }

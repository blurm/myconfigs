#!/bin/bash

##########################################
# System install script for ubuntu 16.04 #
##########################################

### 删除无用程序

### 添加国内软件源
sudo apt update
sudo apt upgrade

### 安装软件 {
    ## Web Tools {
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
        sudo apt-get update
        sudo apt -y install google-chrome-stable

        ## chromium-browser
        sudo apt install chromium-browser

    ## }

    ## sogou input
    sudo apt install sogoupinyin

    ## SendAnyWhere 多平台文件传输
    sudo apt install sendanywhere

    ## System tools {
        sudo apt install unity-tweak-tool
        sudo apt install gnome-tweak-tool
        sudo apt install bleachbit

        # Psensor 检查CPU温度
        sudo apt-get install lm-sensors hddtemp
        sudo sensors-detect 检测硬件传感器
        sensors
        sudo apt-get install psensor
    ## }

    ## 系统美化 {
        # Papirus
        sudo add-apt-repository ppa:varlesh-l/papirus-pack
        sudo apt-get update
        sudo apt-get install papirus-gtk-icon-theme

        # Arc Theme
        sudo sh -c “echo ‘deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /‘ >> /etc/apt/sources.list.d/arc-theme.list”
        sudo apt-get update && sudo apt-get install arc-theme
        wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
        sudo apt-key add - < Release.key
    ## }

    ## Media
    sudo apt install smplayer

    ## i3wm {
        # 程序启动接口
        sudo apt install rofi
        # 美化系统，类似Unity-tweak-tools，在这里修改theme
        sudo apt install lxappearance
        # 更换桌面壁纸
        sudo apt install feh
        # i3-wm
        echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
        sudo apt-get update
        sudo apt-get --allow-unauthenticated install sur5r-keyring
        sudo apt-get update
        sudo apt-get install i3
        # 系统状态栏，用来取代i3status
        sudo apt install i3blocks
        # 去掉Nautilus默认启动桌面
        gsettings set org.gnome.desktop.background show-desktop-icons false
    ## }

    ## Developing tools {
        sudo apt install git

        # Vim

        # Java
        sudo add-apt-repository ppa:webupd8team/java
        sudo apt-get update
        sudo apt-get install oracle-java8-installer

        # Eclipse (need to install manually)

        # Python
        # 语音程序
        sudo apt install espeak
        # GSM Model接口
        sudo apt install minicom

    ## }
# }

#!/bin/sh

# Test script for post_install1.sh and 2.sh
# Check if packages were installled succesfully

testCommandExe() {
    # Reset
    Color_Off='\033[0m'       # Text Reset

    # Regular Colors
    Black='\033[0;30m'        # Black
    Red='\033[0;31m'          # Red
    Green='\033[0;32m'        # Green
    Yellow='\033[0;33m'       # Yellow
    Blue='\033[0;34m'         # Blue
    Purple='\033[0;35m'       # Purple
    Cyan='\033[0;36m'         # Cyan
    White='\033[0;37m'        # White

    # Bold
    BBlack='\033[1;30m'       # Black
    BRed='\033[1;31m'         # Red
    BGreen='\033[1;32m'       # Green
    BYellow='\033[1;33m'      # Yellow
    BBlue='\033[1;34m'        # Blue
    BPurple='\033[1;35m'      # Purple
    BCyan='\033[1;36m'        # Cyan
    BWhite='\033[1;37m'       # White

    # Underline
    UBlack='\033[4;30m'       # Black
    URed='\033[4;31m'         # Red
    UGreen='\033[4;32m'       # Green
    UYellow='\033[4;33m'      # Yellow
    UBlue='\033[4;34m'        # Blue
    UPurple='\033[4;35m'      # Purple
    UCyan='\033[4;36m'        # Cyan
    UWhite='\033[4;37m'       # White

    # Background
    On_Black='\033[40m'       # Black
    On_Red='\033[41m'         # Red

    # Execute the command and hide the output
    eval "$1 2>/dev/null 1>/dev/null"
    if [ $? -eq 0 ]; then
        echo "$1 ${BGreen}OK${Color_Off}"
    else
        echo "$1 ${BRed}FAILED${Color_Off}"
    fi
}
echo "-----Install testing start-----"

testCommandExe 'pip'
testCommandExe 'git --version'
testCommandExe 'sslocal --version'
testCommandExe 'google-chrome --version'
testCommandExe 'chromium-browser --version'
testCommandExe 'calibre --version'
testCommandExe 'samba --version'
testCommandExe 'sslocal --version'
testCommandExe 'dconf-editor --version'
#testCommandExe 'unity-tweak-tool --version'
#testCommandExe 'gnome-tweak-tool --version'
testCommandExe 'hddtemp --version'
testCommandExe 'psensor --version'
#testCommandExe 'xbindkeys -V'
#testCommandExe 'gparted --version'
testCommandExe 'neofetch'
testCommandExe 'xclip -h'
testCommandExe 'smplayer -h'
testCommandExe 'rofi -V'
testCommandExe 'lxappearance -h'
testCommandExe 'i3 --version'
testCommandExe 'i3blocks -h'
testCommandExe 'java -version'
testCommandExe 'vim --version'
testCommandExe 'espeak --version'
#testCommandExe 'minicom --version'
testCommandExe 'flake8 --version'
testCommandExe 'pip show rope'
testCommandExe 'pip show ropemode'
testCommandExe 'pip show requests'
testCommandExe 'pip show pyquery'
testCommandExe 'pip3 show pyquery'
testCommandExe 'pip show beautifulsoup4'
testCommandExe 'pip show selenium'
testCommandExe 'pip show jedi'
testCommandExe 'pip show yapf'
testCommandExe 'phantomjs --version'
testCommandExe 'nodejs --version'
testCommandExe 'jshint --version'
testCommandExe 'npm view tern version'
testCommandExe 'zsh --version'


testCommandExe 'virtualbox --help'
testCommandExe 'nvim --version'
testCommandExe 'fzf --version'
testCommandExe 'ag --version'

echo "-----Install testing ended-----"

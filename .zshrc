# reload non-login shell env
alias sz="source $HOME/.zshrc"
#alias rg="~/mydata/linux\ tools/ripgrep-0.5.2-x86_64-unknown-linux-musl/rg"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/damon/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="damon"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git z extract command-not-found zsh-syntax-highlighting colored-man-pages)
plugins=(git z extract command-not-found zsh-syntax-highlighting colored-man-pages)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line)
# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=034
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=034
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

#{{{ History Stuff

# Where it gets saved. Default is ~/.zsh_history
#HISTFILE=~/.history

HISTSIZE=1000000      # Number of lines kept in memories
SAVEHIST=1000000      # Number of lines kept in history file

# Change shell edit mode from emac to vi
#set -o vi

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS      # If a new line is a duplicate, remove the older line
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_FIND_NO_DUPS         # Ignore duplicates when searching
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_NO_STORE             # Don't store `history` or `fc` command lines
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt SHARE_HISTORY             # Share history between all sessions.
#}}}

# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# -g glob : 搜索模式
# --files : 显示要搜的文件（但不进行搜索），与-g搭配显示符合的文件路径
# --no-ignore : Don't respect ignore files (.gitignore, .ignore, etc.)
# --hidden : Search hidden directories and files
# --follow : Follow symlinks.
# 2> /dev/null : 不回显错误信息
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,*.swp,dist,*.coffee}/*" 2> /dev/null'
#export FZF_ALT_C_COMMAND="bfs -type d -nohidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='rg --files --no-ignore --hidden --follow --glob \
    "!{.git/,.gvfs,.cache/dconf,.config/chromium,.config/pulse,.config/google-chrome}*" \
    --null /home/damon/ | xargs -0 dirname | uniq'
export FZF_DEFAULT_OPTS='
--reverse --ansi
--color fg:244,bg:237,hl:65,fg+:15,bg+:242,hl+:83
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

source /home/rt/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

export PATH=$HOME/bin:/usr/local/bin::$HOME/.local/lib/python3.10/site-packages:$PATH
export ZSH="$HOME/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
source $ZSH/oh-my-zsh.sh
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# User configuration

# i3
alias i3c='vim ~/.config/i3/config'

# vimrc
alias vrc='vim ~/.vimrc'

# Set vi mode
set -o vi

# .zshrc
alias zrc='vim ~/.zshrc'
alias zrl='source ~/.zshrc && echo zsh config reloaded'

# git
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# misc
alias update='sudo pacman -Syu'
alias updatedb='sudo pacman -Syy'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias ..='cd .. && ls'
alias ...='cd ... && ls'
alias vim='nvim'
alias v='nvim'
alias cls='clear'
alias myip='curl icanhazip.com'
alias ll='ls -lah --color=auto'
alias ls='ls --color=auto'
alias dus='du -sckxh * | sort -nr'
alias randpw="openssl rand -base64 64"
alias grep='grep --color=auto -n'
alias seed='ssh dga9ffhoc3bu@juno.whatbox.ca'
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
else
export EDITOR='nvim'
fi

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

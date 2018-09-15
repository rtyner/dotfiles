# Path to your oh-my-zsh installation.
export ZSH="/home/rt/.oh-my-zsh"

export PATH=/home/rt/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

ZSH_THEME="robbyrussell"

. /usr/share/zsh/site-contrib/powerline.zsh

COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  zsh-syntax-highlighting
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# default permissions on newly created files
umask 077

# if non-ambiguous, allow changing into a directory just by typing its name
setopt autocd

# detect and prompt correction of types in commands
setopt correct

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='vim'
fi

# keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Aliasing

# i3
alias i3c='vim ~/.config/i3/config'

# polybar
alias pbar='vim ~/.config/polybar/config'

# vimrc
alias vrc='vim ~/.vimrc'

# .zshrc
alias zrc='vim ~/.zshrc'
alias zrl='source ~/.zshrc && echo zsh config reloaded'

# fix typos
alias ;s='ls -lah'
alias ks='ls -lah'
alias sl='ls -lah'

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

# dirs
alias dirs='dirs -v'
alias pj='cd /home/rt/projects'
alias h='cd ~'
alias drive='cd /home/rt/rusty@rtyner.com'
alias pcc='cd /home/rt/projects/python-crash-course'
alias dots='cd /home/rt/projects/dotfiles'
alias notes='cd /home/rt/projects/notes'
alias red='cd /mnt/media'

# misc
alias update='sudo pacman -Syu'
alias updatedb='sudo pacman -Syy'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias ..='cd .. && ls'
alias ...='cd ... && ls'
alias v='vim'
alias cls='clear;ls'
alias myip='curl icanhazip.com'
alias ll='ls -lah --color=auto'
alias ls='ls -lh --color=auto'
alias sudo='nocorrect sudo'
alias today='calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
alias dus='du -sckxh * | sort -nr'
alias savecmd='vim ~/projects/linux-command-ref/useful-commands.md'
alias seed='sftp wranks@genesis.whatbox.ca'

# colorize grep output
alias grep='grep --color=auto -n'

#powerline-daemon -q
# . /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

source /home/rt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

ZSH_THEME="simple"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  zsh-syntax-highlighting
  git
)

source $ZSH/oh-my-zsh.sh

# Google cloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rt/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rt/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rt/google-cloud-sdk/completion.zsh.inc'; fi

# User configuration

# Autocomplete SSH
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | \ sed -e s/,.*//g | uniq | grep -v "["`;)" ssh""

# Reload .zshrc
alias zshreload='source ~/.zshrc && echo zsh config reloaded'

# fix typos
alias sl='ls -la'
alias ;s='ls -la'
alias ks='ls -la'

# git
alias add='git add'
alias commit='git commit'
alias push='git push'
alias pull='git pull'

# dirs
alias dirs='dirs -v'
alias home='cd ~'
alias dtop='cd ~/Desktop'
alias dload='cd ~/Downloads'
alias pj='cd ~/Projects'

# misc 
alias zshrc='sudo ~/.zshrc'
alias ..='cd .. && ls'
alias v='vim'
alias cls='clear'
alias myip='curl icanhazip.com'
alias ll='ls -G -la'
alias ls='ls -G -la'
alias sudo='nocorrect sudo'

# powershell
alias powershell='posh'

# ssh
alias wp='ssh -p 52199 rusty@wp'

# generate random 20 char pw w/ openSSL
alias randpw="openssl rand -base64 20"

# colorize grep output
alias grep='grep --color=auto -n'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#export EDITOR='vim'
#else
#export EDITOR='vim'
#fi

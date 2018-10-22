alias p3='python3'
alias p2='python2.7'
alias l=ls
alias v=vim
alias f=fg

alias rs='. ~/.bash_profile'

vimpatch() {
    grep "+++" | sed "s:\+\+\+ b/::g" | xargs vim
}

# ls options
alias ls='ls -lh --color'
export CLICOLOR=

# locale
export LC_ALL=en_US.UTF-8

# "git: clean branches"
# alias gitcb='git checkout master && git branch --merged | grep -v master | xargs git branch -d'
gitcb() {
    if [[ -z "$1" ]]; then
        echo "Need branch name."
        exit 1
    fi
    git checkout "$1"
    git branch --merged | grep -v "$1" | xargs git branch -d
}

# git aliases (matching .vimrc)
alias gs='git status -sb'
alias gc='git commit -m'
alias ge='git commit --amend' # I use it more like "emend"
alias gp='git push origin'
alias gb='git branch'
alias gd='git diff --cached' # show staged changes
alias ga='git add -p'
alias gu='git pull'
alias gh='git checkout'
alias gH='git checkout -b'
alias gP='git push -u origin `git symbolic-ref --short HEAD`'
alias gm='git merge'
alias gM='git checkout master'
alias gf='git fetch'
alias gr='git reset'
alias gR='git reset --hard'
alias gl='git log --oneline --graph --decorate'
alias gL='git log --branches --remotes --tags --oneline --graph --decorate'

# clone from GitHub
ghclone() {
    git clone --recursive https://github.com/$1/$2
}

mcd() {
    mkdir "$1" && cd "$1"
}

# display config
PS1='[\u@\h \W]$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/opt/bison/bin:$PATH"

set -o vi
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# Untracked
if [ -f ~/.bash_profile_extra ]; then
    . ~/.bash_profile_extra
fi

alias p3='python3'
alias p2='python2.7'
alias v=vim
alias f=fg
alias rs='. ~/.bash_profile'
alias ni=ninja

vimpatch() {
    grep "+++" | sed "s:\+\+\+ b/::g" | xargs vim
}

# ls options
alias ls='ls -lh --color'
alias l=ls
export CLICOLOR=

# locale
export LC_ALL=en_US.UTF-8

# editor
export EDITOR=vim

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
alias gv='git checkout -' # 'git checkout preVious'
alias gP='git push -u origin `git symbolic-ref --short HEAD`'
alias gm='git merge'
alias gM='git checkout master'
alias gf='git fetch'
alias gr='git reset'
alias gR='git reset --hard'
alias gl='git log --oneline --graph --decorate'
alias gL='git log --branches --remotes --tags --oneline --graph --decorate'
alias gi='git rebase -i'
alias grc='git rebase --continue'
alias gra='git rebase --abort'

alias gcf='git commit --fixup'
alias gcs='git commit --squash'

# "force pull"
gU() {
    git fetch origin $(git rev-parse --abbrev-ref HEAD)
    git reset --hard FETCH_HEAD
}

# put the last commit on a new branch
gUH() {
    git checkout -b $1 -q && git checkout - -q && git reset --hard HEAD^ -q && git checkout $1 -q
}

# git branch, current
gcb() {
    git branch | grep '^\*' | cut -d' ' -f2
}

# git force-push current branch only
gfpc() {
    git push origin -f $(gcb)
}

# clone from GitHub
ghclone() {
    git clone --recursive https://github.com/$1/$2
}

mcd() {
    mkdir "$1" && cd "$1"
}

# rg for matches and open in vim
vimrg() {
    vim $(rg -l "$@" | xargs)
}

# display config
PS1='[\[\e[0;32m\]\u\[\e[0m\]@\h \[\e[0;36m\]\W\[\e[0m\]]$ '

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

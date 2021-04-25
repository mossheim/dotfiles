if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
      exec startx
fi

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

alias gF='git clang-format'

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

# Untracked
if [ -f ~/.bash_profile_extra ]; then
    . ~/.bash_profile_extra
fi

# better LS_COLORS for my stuff. should probably put this in a separate file somewhere
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=04;33:ow=04;33:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

export GPG_TTY=$(tty)

if ! ssh-add -T ~/.ssh/id_rsa 2>/dev/null; then
    ssh-add 2>/dev/null
fi

if [[ -d ~/.local/share/gem/ruby/3.0.0/bin ]]; then
    export PATH=~/.local/share/gem/ruby/3.0.0/bin:$PATH
fi

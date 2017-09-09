alias lldbox='cd ~/Dropbox\ \(Love\ Local\ Design\)/Love\ Local\ Design\ Team\ Folder'
alias bribox='cd ~/Dropbox\ \(Personal\)/'
alias Sublime='Sublime Text'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'
alias slack='/Applications/Slack.app/Contents/MacOS/Slack'
alias pdfmerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'
alias sclang='/Applications/SuperCollider.app/Contents/MacOS/sclang'
alias p3='python3'
alias gpoum='git pull upstream master && git push origin master'

# ls options
alias ls='ls -lh'
export CLICOLOR=

# "git: clean branches"
alias gitcb='git checkout master && git branch --merged | grep -v master | xargs git branch -d'

# git aliases (matching .vimrc)
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias gb='git branch'
alias ga='git add -p'
alias gu='git pull'
alias gh='git ch'
alias gH='git ch -b'
alias gP='git push -u origin `git symbolic-ref --short HEAD`'
alias gM='git checkout master'
alias gf='git fetch'
alias gr='git reset'
alias gR='git reset --hard'
alias gl='git lg'

# clone from GitHub
ghclone() {
    git clone --recursive https://github.com/$1/$2
}

# SuperCollider commands
alias scconf='cmake -GXcode -DRULE_LAUNCH_COMPILE=ccache -DCMAKE_PREFIX_PATH=`brew --prefix qt55` -DSUPERNOVA=ON ..'
alias scmake='cmake --build . --target install --config Debug'

export SC_REPO='/Users/brianheim/git/supercollider'
sctest() {
    cd "$SC_REPO/build"
    # if building fails, reconfigure and build from scratch
    if git fetch $1 && git checkout $2
    then
        if scmake
        then
            exit 0
        else
            scconf && scmake
        fi
    fi
}

# mimic rg if not on platform
if ! which rg >/dev/null 2>/dev/null
then
    function rg() {
        grep -rI $1 .
    }
fi

# display config
PS1='[\u@\h \W]$ '

# PATHs
PATH=$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/opt/bison/bin:$PATH"

# Settings to use on Yale's fedora boxes
if hostname | grep "zoo\.cs\.yale\.edu" >/dev/null
then
    # for iTerm supporting backspace
    export TERM=xterm-256color
    # for cs422
    source /c/cs422/env.sh
fi

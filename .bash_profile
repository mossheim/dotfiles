alias lldbox='cd ~/Dropbox\ \(Love\ Local\ Design\)/Love\ Local\ Design\ Team\ Folder'
alias bribox='cd ~/Dropbox\ \(Personal\)/'
alias Sublime='Sublime Text'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'
alias slack='/Applications/Slack.app/Contents/MacOS/Slack'
alias pdfmerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'
alias sclang='/Applications/SuperCollider.app/Contents/MacOS/sclang'
alias p3='python3'
alias gpoum='git pull upstream master && git push origin master'

PS1='[\u@\h \W]$ '
PATH=$PATH:$HOME/bin:/usr/local/opt/go/libexec/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="/usr/local/opt/bison/bin:$PATH"


##
# Your previous /Users/moshebergman/.bash_profile file was backed up as /Users/moshebergman/.bash_profile.macports-saved_2011-10-01_at_09:29:55
##

# MacPorts Installer addition on 2011-10-01_at_09:29:55: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/Users/moshebergman/workspace/adt-bundle-mac-x86_64-20131030/sdk/platform-tools/:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
# Finished adapting your PATH environment variable for use with MacPorts.

alias ll='ls -laG'
alias wget="curl -O"
alias linode='ssh linode'
alias cgulp='gulp --require coffee-script'
#alias vagrant'ssh vagrant'

# docker
alias dl='docker ps -l -q'

# other
alias reload='source ~/.bash_profile'

# git
alias gaa='git add -A'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gca='git commit -v -a'
alias gr='git reset'

function parse_git_branch () {
       git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="%ANDROID_HOME%\platform-tools:${PATH}"
GOPATH=/Users/moshebergman/workspace/go/
export GOPATH
export PATH=$PATH:$GOPATH/bin
export NVM_DIR=~/.nvm

# Tasks
alias tasks-plan-my-time='. ~/tasks/plan-my-time.sh'
alias tasks-algorithms='~/tasks/algorithms.sh'
alias tasks-math-comp-sci='find ~/tasks/math-comp-sci -maxdepth 1 -type f -exec cmd; \'

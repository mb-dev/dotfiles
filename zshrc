# P ath to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)

# User configuration
export ANDROID_HOME=/usr/local/opt/android-sdk
export GOPATH=$HOME/workspace/go/
export PYTHON3_PATH=/usr/local/opt/python@3.7/bin

export PATH="$PYTHON3_PATH:$GOPATH/bin:/usr/local/bin:$PATH"

# export REQUESTS_CA_BUNDLE=/usr/local/etc/openssl/certs/cacert.pem
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
compinit -D ~/.zcompdump

# load other aliases--HEAD
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.bash_extras ] && source ~/.bash_extras

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

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
# Skip forward/back a word with opt-arrow
alias reload='source ~/.zshrc'
alias ag='ag --path-to-ignore ~/.agignore'
alias gc-='git checkout -'
alias gb='git branch --sort=-committerdate'
alias editrefmd='code ~/Dropbox/Reference\ Documentation'
alias editdot='code ~/workspace/dotfiles'
alias twitch-wifi='osascript ~/connect-twitch-wifi.scpt'
alias gpsu="git push --set-upstream origin `git symbolic-ref --short HEAD`"
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias chromemail="chrome --new-window 'https://mail.google.com/mail/u/1/?tab=cm#inbox' 'https://mail.google.com/mail/u/0/#inbox' 'https://calendar.google.com/calendar/b/1/render?tab=mc#main_7' 'https://calendar.google.com/calendar/b/0/r/week?tab=mc' 'https://www.facebook.com/' 'https://jira.twitch.com/secure/RapidBoard.jspa?rapidView=482&view=planning&selectedIssue=VWT-816&quickFilter=2118&epics=visible'"
alias gotwitch="cd ~/workspace/go/src/code.justin.tv/"
alias untargz="tar xzvf"

# Key binding
bindkey '[C' forward-word
bindkey '[D' backward-word

# Skip to start/end of line with cmd-arrow
bindkey '[E' beginning-of-line
bindkey '[F' end-of-line

# Delete word with opt-backspace/opt-delete
bindkey '[G' backward-kill-word
bindkey '[H' kill-word

# Delete line with cmd-backspace
bindkey '[I' kill-whole-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=/Users/moshebe/.toolbox/bin:$PATH
export PATH="$PATH:$HOME/.poetry/bin"
export PATH="/usr/local/opt/node@12/bin:$PATH"

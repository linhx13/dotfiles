# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="aussiegeek"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias rm="rm -i"
alias mv="mv -i"
alias vi="vim"

function ta() {
if [ $# -eq 1 ]; then
    if tmux attach-session -t $1; then
        ;
    else
        tmux new -s $1
    fi
else
    if tmux attach-session -t 0; then
        ;
    else
        tmux
    fi
fi
}
alias tls="tmux list-sessions"

export ALTERNATE_EDITOR=""
alias ec="emacsclient -t"
alias eck="emacsclient -e '(kill-emacs)'"


if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

export PATH="/opt/userhome/ichongxiang/local/emacs-24.5/bin:$PATH"
#export PATH="/opt/userhome/ichongxiang/local/word2vec:$PATH"
#export PATH="/opt/userhome/ichongxiang/local/fastText:$PATH"

#export PATH="/opt/userhome/ichongxiang/local/opencc/bin:$PATH"
#export LD_LIBRARY_PATH="/opt/userhome/ichongxiang/local/opencc/lib:${LD_LIBRARY_PATH}"

export PATH="/opt/app/Python2.7/bin:${PATH}"

LOCAL_HOME="/opt/userhome/ichongxiang/.local"
export PATH="${LOCAL_HOME}/bin:${PATH}"
export LD_LIBRARY_PATH="${LOCAL_HOME}/lib:${LD_LIBRARY_PATH}"

export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_SCRIPT=${LOCAL_HOME}/bin/virtualenvwrapper.sh
source ${LOCAL_HOME}/bin/virtualenvwrapper_lazy.sh

export SVN_EDITOR="vim"
function sa() {
    if [ $# -ne 1 ]; then
        return 1
    else
        screen -D -R $1
    fi
}

alias sd="sa download"
alias sls="screen -list"

export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
if [ $(uname) = "Linux" ]; then
    ssh-add -l 2>/dev/null >/dev/null
    if [ $? -ge 2 ]; then
        ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
        ssh-add ~/.ssh/id_rsa.ifchange.kdd < ~/.ssh/id_rsa.ifchange.kdd.keyphrase
    fi
fi

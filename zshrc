# Path to your oh-my-zsh installation.
export ZSH=/Users/gaspar_d/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

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
plugins=(git bundler osx mongo docker vagrant ssh-agent)

# User configuration

export PATH="/usr/local/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:/opt/local/bin:/opt/vagrant/bin/:/usr/local/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:/opt/local/bin:/opt/vagrant/bin/:/Users/gaspar_d/.rvm/gems/ruby-2.2.0/bin:/Users/gaspar_d/.rvm/gems/ruby-2.2.0@global/bin:/Users/gaspar_d/.rvm/rubies/ruby-2.2.0/bin:/usr/local/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/:/opt/local/bin:/opt/vagrant/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/gaspar_d/.rvm/bin:/Users/gaspar_d/.rvm/bin:/Users/gaspar_d/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
#
alias ls='ls -C -G -l'

alias grep='grep --color=auto'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias c='clear'
alias less='less --quiet'
alias s='cd ..'
alias df='df -h'
alias du='du -h'
alias md='mkdir'
alias rd='rmdir'

export EMAIL='d.gasparina@gmail.com'
SAVEHIST=100000
HISTFILE=~/.zsh_history


if [ "$TERM" = "linux" -o "$TERM" = "screen" -o "$TERM" = "rxvt" ]
then
  bindkey '[1~' beginning-of-line       # Home
  bindkey '[4~' end-of-line             # End
fi


export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

bindkey '[C' forward-word
bindkey '[D' backward-word

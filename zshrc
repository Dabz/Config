# The following lines were added by compinstall
zstyle :compinstall filename '/home/gaspar_d/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
zmodload zsh/complist
ZSH_THEME="geometry/geometry"
GEOMETRY_PROMPT_PLUGINS=(virtualenv docker_machine exec_time git hg)
source ~/.zsh_plugins.sh
export PATH="$HOME/bin:/usr/local/bin/:/opt/local/bin/:/opt/vagrant/bin/:/usr/local/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin/"
export LANG=en_US.UTF-8
export EDITOR='vim'

#export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export WORDCHARS=''
bindkey "^[[1;5C" emacs-forward-word
bindkey "^[[1;5D" emacs-backward-word
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "\e[3~" delete-char

alias ls='ls -C -G -l --color'
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
alias vim='nvim'

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
export PKGEXT=.pkg.tar
export MAIL_KEY=vmzrispzmhvvhzov

bindkey '[C' forward-word
bindkey '[D' backward-word
bindkey '^R' history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^D" delete-char-or-list
bindkey "^E" end-of-line
bindkey "^K" kill-line

export HISTFILE=~/.zhistory
export HISTSIZE=SAVEHIST=1000000
setopt sharehistory
setopt extendedhistory
zmodload zsh/complist
zstyle ':completion:*' menu yes select

# export GOOGLE_APPLICATION_CREDENTIALS=/home/gaspar_d/.ssh/adeo.gcp.json

compinit


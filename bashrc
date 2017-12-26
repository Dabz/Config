# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Uncomment the next line if you want to be informed via audio everytime a login is done in your computer (terribly usefull if you want to be noticed when somebody has logged in your computer). Note: remember that some processes like the bonus disks, launch a
#'bash' command so you can ear the sound too
#aplay /usr/share/eliva-sounds/beep.wav 1>/dev/null 2>&1 &

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export HISTFILESIZE=10000000
# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#export PS1="\[\033[0;32m\]\[\033[1;39m\]\u\[\033[0;36m\]@\[\033[1;39m\]\h\[\033[1;36m\][\[\033[1;39m\]\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|urxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias l='ls -la'
alias s='cd ..'
alias ..='cd ..'
alias xmame='xmame.SDL -jdev /dev/input/js -jt 1 -fullscreen -afs'
alias grep='grep -i --color'
alias emacs='emacs -nw '
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=30;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:*.deb=01;33:*.edj=05;33:"


# Prompt depending of your connection type
THIS_TTY=tty`ps aux | grep $$ 2>/dev/null | grep bash 2>/dev/null | awk '{ print $7 }'`
SESS_SRC=`who | grep $THIS_TTY 2>/dev/null | awk '{ print $6 }'`

SSH_FLAG=0
SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
if [ $SSH_IP ] ; then
  SSH_FLAG=1
fi
SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] ; then
  SSH_FLAG=1
fi
if [ $SSH_FLAG -eq 1 ] ; then
  CONN=ssh
elif [ -z $SESS_SRC ] ; then
  CONN=lcl
elif [ $SESS_SRC = "(:0.0)" -o $SESS_SRC = "" ] ; then
  CONN=lcl
else
  CONN=tel
fi

# Okay...Now who we be?
if [ `/usr/bin/whoami` = "root" ] ; then
  USR=priv
else
  USR=nopriv
fi

assign_color_host()
{
   codehostname=$( echo $HOSTNAME | md5sum | sed 's/[a-z]//g' )
      codehostname=$( expr ${codehostname:0:6} % 8 )
      case $codehostname in
         0)  colorhostname="\[\033[0;31m\]" ; ;;
         1)  colorhostname="\[\033[0;32m\]" ; ;;
         2)  colorhostname="\[\033[0;33m\]" ; ;;
         3)  colorhostname="\[\033[0;35m\]" ; ;;
         4)  colorhostname="\[\033[0;36m\]" ; ;;
         5)  colorhostname="\[\033[1;31m\]" ; ;;
         6)  colorhostname="\[\033[1;32m\]" ; ;;
         7)  colorhostname="\[\033[1;35m\]" ; ;;
         8|*)  colorhostname="\[\033[1;33m\]" ; ;;
      esac

### Example of how to set a fixed color for a specific hostname
#      case $HOSTNAME in
#         my_favorite_hostname) colorhostname="my_favorite_color_assigned" ; ;;
#      esac
}


#Set some prompts...
if [ $CONN = lcl -a $USR = nopriv ] ; then
  export PS1="\[\033[1;36m\][\[\033[1;39m\]\u \w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
elif [ $CONN = lcl -a $USR = priv ] ; then
  export PS1="\[\033[1;36m\][\[\033[1;31m\]\u \[\033[1;39m\]\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
elif [ $CONN = tel -a $USR = nopriv ] ; then
  export PS1="\[\033[0;32m\]\[\033[1;39m\]\u\[\033[0;36m\]@\[\033[1;39m\]\h\[\033[1;36m\][\[\033[1;39m\]\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
elif [ $CONN = tel -a $USR = priv ] ; then
  export PS1="\[\033[0;32m\]\[\033[1;31m\]\u\[\033[0;36m\]@\[\033[1;39m\]\h\[\033[1;36m\][\[\033[1;39m\]\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
elif [ $CONN = ssh -a $USR = nopriv ] ; then
   assign_color_host
  export PS1="\[\033[1;36m\][\[\033[1;39m\]\u\[\033[0;36m\]@$colorhostname\h\[\033[0;39m\]\[\033[1;39m\]:\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
elif [ $CONN = ssh -a $USR = priv ] ; then
   assign_color_host
  export PS1="\[\033[1;36m\][\[\033[1;31m\]\u\[\033[0;36m\]@$colorhostname\h\[\033[0;39m\]\[\033[1;39m\]:\w\[\033[1;36m\]]\[\033[1;39m\]\\$\[\033[1;39m\] "
fi

export XDG_DATA_DIRS="/usr/share/xdgeldsk:/usr/local/share:/usr/share"

# Uncomment the next line if you have enabled the audio notification (first lineof this file)
#wait


export FULLNAME="Damien Gasparina"
export EDITOR=vim


export NNTPSERVER=news.epita.fr
# 1. Les alias #
alias ls='ls -C -G -l --color'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l --color'
alias la='ls -a --color'
alias lla='ls -la --colo --color'
# Quelques alias pratiques
alias c='clear'
alias less='less --quiet'
alias s='cd ..'
alias df='df -h'
alias du='du -h'
alias m='mutt -y'
alias md='mkdir'
alias rd='rmdir'
alias top='htop'
alias gccmul='gcc -W -Wall -Werror -g '
alias tree='tree -C'
alias xmame='xmame.SDL --fullscreen -jdev /dev/input/js -jt 1'
alias xlock='xlock -mode blank -count 60 -timeelapsed +description -info "Welcome on Danz_Asus" -fg green -bg black -allowroot -delay 20'
alias mocp='mocp -T green_theme'
alias z='zlock -immed'
export EPITA_STRICT=1
export PAGER=less
alias samesoul='wine ~/.wine/drive_c/Program\ Files/SameSoul/SameSoul.exe'

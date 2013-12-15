# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;; *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1="${debian_chroot:+($debian_chroot)}\[\033[00;38;5;37m\][\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00;38;5;37m\]]\[\033[00m\]\`if [ \$? = 0 ]; then echo \[\e[33m\]$; else echo \[\e[31m\]$; fi \` \[\033[00m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi

alias tmux='tmux -2 -u'

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background

cUser='\[\033[00;38;5;98m\]'
cHost='\[\033[00;38;5;98m\]'
cPwd='\[\033[01;34m\]'
cDate='\e[1;30m'
cDivider='\[\033[00;38;5;37m\]'

# Code for a cool Prompt
function pre_prompt
{
	exitStatus="$?"

	newPWD="${PWD}"
	user="whoami"
	host=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
	datenow=$(date "+%a, %d %b %y")
	#let promptsize=$(echo -n "--|$user@$host:${PWD}|---|llllllllllll|ddd:ddd|j|---" \
		#| wc -c | tr -d " ")
	let promptsize=$(echo -n "--|$user@$host:${PWD}|-|$(load_show)|$(date "+%H:%M")|$(jobs_show)|--" \
		| wc -c | tr -d " ")

	width=$(tput cols)

	if [ `id -u` -eq 0 ]
	then
		let fillsize=${width}-${promptsize}+1
	else
		let fillsize=${width}-${promptsize}-1
	fi

	fill=""

	while [ "$fillsize" -gt "0" ]
	do
		fill="${fill}─"
		let fillsize=${fillsize}-1
	done

	if [ "$fillsize" -lt "0" ]
	then
		let cutt=3-${fillsize}
		newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
	fi

	if [ "${exitStatus}" -eq 0 ]
	then 
		promt_color=$'\[\033[01;32m\]'
	else
		promt_color=$'\[\e[31m\]'
	fi
	
	#-------------------------------
	let promptsize=$(echo -n "--|$user@$host:${newPWD}|-|$(load_show)|$(date "+%H:%M")|$(jobs_show)|--" \
		| wc -c | tr -d " ")

	if [ `id -u` -eq 0 ]
	then
		let fillsize=${width}-${promptsize}+1
	else
		let fillsize=${width}-${promptsize}-1
	fi

	if [ "$fillsize" -lt "0" ]
	then
		PS1="${debian_chroot:+($debian_chroot)}${promt_color}> ${cBorder}"
		return
	fi

	PS1="${debian_chroot:+($debian_chroot)}${cBorder}┌─|${cUser}\u${cDivider}@${cHost}\h${cBorder}:${cPwd}\$newPWD${cBorder}|─\${fill}─|\$(load_color)\$(load_show)${cBorder}|${cDate}\$(date \"+%H:%M\")${cBorder}|\$(job_color)\$(jobs_show)${cBorder}\
${cBorder}|─┐\n${cBorder}└${promt_color}$ ${cBorder}"
}

NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
SLOAD=$(( 100*${NCPU} ))        # Small load
MLOAD=$(( 200*${NCPU} ))        # Medium load
XLOAD=$(( 400*${NCPU} ))        # Xlarge load

# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
    local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    # System load of the current host.
    echo $((10#$SYSLOAD))       # Convert to decimal.
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}

function jobs_show()
{
	njobs=$(jobs | wc -l)
	echo $njobs
}

function load_show()
{
	local SYSLOAD=$(cut -d " " --fields=1,2,3 /proc/loadavg)
	echo $SYSLOAD
}

# Set prompt colour
if [ `id -u` -eq 0 ]
then
	cText="${LightRed}"
	cBorder="${Red}"
else
	cText="${LightCyan}"
	cBorder="\[\033[00m\]"
fi

PROMPT_COMMAND=pre_prompt

#PS1="${cBorder}┌─|\[\033[00;38;5;98m\]\u\[\033[00;38;5;37m\]@\[\033[00;38;5;98m\]\h${cBorder}|─\${fill}─|\$(load_color)\$(load)%${cBorder}|\e[1;30m\$(date \"+%H:%M\")${cBorder}|\$(job_color)\$(jobs_show)${cBorder}|─|\[\033[01;34m\]\$newPWD\
#${cBorder}|────┐\n${cBorder}└\$(echo -en \$promt_color)$ \[\033[00m\]"

#Start tmux on every shell login
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# TMUX
#if which tmux 2>&1 >/dev/null; then
    #if not inside a tmux session, and if no session is started, start a new session
    #test -z "$TMUX" && (tmux attach || tmux new-session)
#fi


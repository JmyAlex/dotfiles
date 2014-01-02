# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export BSPWM_SOCKET="/tmp/bspwm-socket"
export PANEL_FIFO=/tmp/panel-fifo
export PATH=$PATH:$HOME/bspwmPanel

export BSPWM_TREE="$XDG_DATA_HOME/bspwm.tree"
export BSPWM_HISTORY="$XDG_DATA_HOME/bspwm.history"
export BSPWM_STACK="$XDG_DATA_HOME/bspwm.stack"

export LANG=en_US.UTF-8

export DPMS_STANDBY=180
export DPMS_SUSPEND=360
export DPMS_OFF=480

export SHELL_COLORS="$HOME/.shell_colors"
export SHELL_PROMT="$HOME/.shell_promt"
export SHELL_ALIASES="$HOME/.shell_aliases"
export SHELL_FUNCTIONS="$HOME/.shell_functions"

export LESS_TERMCAP_mb=$'\e[1;31m'     # begin blinking
export LESS_TERMCAP_md=$'\e[1;34m'     # begin bold
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_so=$'\e[40;37m'    # begin standout - info box
export LESS_TERMCAP_se=$'\e[0m'        # end standout
export LESS_TERMCAP_us=$'\e[1;33m'     # begin underline
export LESS_TERMCAP_ue=$'\e[0m'        # end underline

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

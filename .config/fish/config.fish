set fish_greeting ""

set -x TERM "xterm-256color"

#locale
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -gx PATH "$HOME/bin" $PATH

# colored GCC warnings and errors
set -gx GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -gx FZF_DEFAULT_OPTS '
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'

#XDG
# System
#set -x XDG_DATA_DIRS /usr/share /usr/local/share
#set -x XDG_CONFIG_DIRS /etc/xdg

# User
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_DESKTOP_DIR $HOME/Desktop
set -x XDG_DOWNLOAD_DIR $HOME/Downloads
set -x XDG_DOCUMENTS_DIR $HOME/Documents
set -x XDG_MUSIC_DIR $HOME/Music
set -x XDG_PICTURES_DIR $HOME/Pictures
set -x XDG_VIDEOS_DIR $HOME/Videos

#navigation
function ... ; cd ../.. ; end
function .... ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

#exa
alias ls="exa --group-directories-first"
alias lth="ls -lrs modified"
alias l="ls -F"
alias lg="exa --long --git"

#default ls
#alias l="ls -CF"
alias ll="ls -alF"
alias la="ls -A"
alias lc="colorls"

alias vssh="ssh -p 3022 developer@127.0.0.1"

function generate_tags --description "Generate ctags and cscope for C"
	find -name '*.[hc]' -exec ctags '{}' + ; find -name '*.[hc]' -exec cscope -b '{}' +
end

# fkill - kill process
function fkill
    bash -c '
    pid=$(ps -ef | sed 1d | fzf-tmux -m | awk "{print \\$2}")

    if [ "x$pid" != "x" ]
        then
        kill -${1:-9} $pid
    fi'
end

# vi: ft=fish

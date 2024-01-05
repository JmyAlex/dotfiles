set fish_greeting ""

set -x TERM "xterm-256color"

#locale
set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x EDITOR "nvim"


set -gx PATH "$HOME/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH

# colored GCC warnings and errors
set -gx GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

#export HIGHLIGHT_STYLE=clarity
export MANPAGER="sh -c 'ansifilter | col -bx | bat -l man -p'"
export LS_COLORS="$(vivid generate catppuccin-frappe)"

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
alias ls="exa --group-directories-first --icons"
alias lth="ls -lrs modified"
alias l="ls -F --icons"
alias lg="exa --long --git"

#default ls
#alias l="ls -CF"
alias ll="ls -alF"
alias la="ls -A"
alias lc="colorls"

alias vssh="ssh -p 3022 developer@127.0.0.1"
alias vim="nvim"
#alias find="fd"
#alias cat=bat
alias df=duf
alias ps=procs

function generate_tags --description "Generate ctags and cscope for C"
    find -name '*.[hc]' -exec ctags '{}' + ; find -name '*.[hc]' -exec cscope -b '{}' +
end

function fzf_snippet
    ls -d --no-icons ~/snippets/* | fzf --multi --preview-window=up:50% --preview 'cat {}' | xargs cat | xclip
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


# Catppuccin color palette

# --> special
set -l foreground c6d0f5
set -l selection 414559

# --> palette
set -l teal 81c8be
set -l flamingo eebebe
set -l mauve ca9ee6
set -l pink f4b8e4
set -l red e78284
set -l peach ef9f76
set -l green a6d189
set -l yellow e5c890
set -l blue 8caaee
set -l gray 737994

# Syntax Highlighting
set -g fish_color_normal $foreground
set -g fish_color_command $blue
set -g fish_color_param $flamingo
set -g fish_color_keyword $red
set -g fish_color_quote $green
set -g fish_color_redirection $pink
set -g fish_color_end $peach
set -g fish_color_error $red
set -g fish_color_gray $gray
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $pink
set -g fish_color_escape $flamingo
set -g fish_color_autosuggestion $gray
set -g fish_color_cancel $red

# Prompt
set -g fish_color_cwd $yellow
set -g fish_color_user $teal
set -g fish_color_host $blue

# Completion Pager
set -g fish_pager_color_progress $gray
set -g fish_pager_color_prefix $pink
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $gray


starship init fish | source

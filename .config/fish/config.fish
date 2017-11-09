set -g Z_SCRIPT_PATH "~/$HOME/Github/z/z.sh"

set fish_greeting ""

set -x TERM "xterm-256color"

set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -gx PATH "$HOME/bin" $PATH

# colored GCC warnings and errors
set -gx GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#navigation
function ... ; cd ../.. ; end
function .... ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function l ; ls -CF ; end
function ll ; ls -alF ; end
function la ; ls -A ; end
function lc ; colorls ; end

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

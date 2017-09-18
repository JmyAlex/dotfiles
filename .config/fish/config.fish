set -g Z_SCRIPT_PATH "/home/jeremy/Github/z/z.sh"

set -x FZF_TMUX 1

#set -x FZF_DEFAULT_OPTS '
  #--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
  #--color info:183,prompt:110,spinner:107,pointer:167,marker:215
#'

set fish_greeting ""

#navigation
function ...
    cd ../..
end

function ....
    cd ../../..
end

function .....
    cd ../../../..
end

function l
    ls -CF
end

function ll
    ls -alF
end

function la
    ls -A
end

function lc
    colorls
end

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

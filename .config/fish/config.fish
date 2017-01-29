set -g Z_SCRIPT_PATH "/home/jeremy/Github/z/z.sh"

set fish_greeting ""

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

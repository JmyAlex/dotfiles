function z.check --on-variable PWD --description 'Setup z on directory change'
    status --is-command-substitution; and return
    bash -c "source $Z_SCRIPT_PATH; _z --add `pwd -P`"
end

# SYNOPSIS
#   z [options]
#
# USAGE
#   Options
#
function z -d "jump around"
  cd (bash -c "source $Z_SCRIPT_PATH; _z $argv; echo \$PWD")
end

function __z.complete
  bash -c "source $Z_SCRIPT_PATH; _z -l $argv" ^| awk '{print $2}'
end

complete -c z -s c -d "Restrict matches to subdirectories of the current directory"
complete -c z -s h -d "Show a brief help message"
complete -c z -s l -d "List only"
complete -c z -s r -d "Match by rank only"
complete -c z -s t -d "Match by recent access only"
complete -c z -s x -d "Remove the current directory from the datafile"

complete -c z --no-files -a '(__z.complete)'

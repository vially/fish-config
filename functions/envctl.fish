if not set -q __envctl_data_dir
  set -g __envctl_data_dir $HOME/.local/share/envctl
  if not [ -d $__envctl_data_dir ]
    mkdir -p $__envctl_data_dir
  end
end

function envctl
  if [ (count $argv) -eq 0 ]
    return
  end

  set -l cmd $argv[1]
  set -l funcname "__envctl_$cmd"
  set -l scargs

  if [ (count $argv) -gt 1 ]
    set scargs $argv[2..-1]
  end

  if functions -q $funcname
    eval $funcname $scargs
  else
    echo "The subcommand $cmd is not defined"
    return 1
  end
end

function __envctl_activate --description "Activate an environment"
  # check arguments
  if [ (count $argv) -lt 1 ]
    echo "You need to specify an environment"
    return 1
  end

  set -l envname $argv[1]
  set -l envfile $__envctl_data_dir/$envname.env
  if not [ -e $envfile ]
    echo "The environment $envname does not exist"
    return 2
  end

  env __envctl_active_project=$envname (cat $envfile) fish
end

function __envctl_print --description "Print an environment"
  set -l envname $__envctl_active_project
  if [ (count $argv) -gt 0 ]
    set envname $argv[1]
  else if not set -q __envctl_active_project
    echo "You need to specify an environment"
    return 1
  end

  set -l envfile $__envctl_data_dir/$envname.env
  if not [ -e $envfile ]
    echo "The environment $envname does not exist"
    return 2
  end

  for line in (cat $envfile)
    echo -s (set_color $fish_color_param) (echo $line | cut -d = -f 1) (set_color normal) "=" (set_color $fish_color_quote) (echo $line | cut -d = -f 2-) (set_color normal)
  end
end

function __envctl_edit --description "Edit an environment"
  set -l envname $__envctl_active_project
  if [ (count $argv) -gt 0 ]
    set envname $argv[1]
  else if not set -q __envctl_active_project
    echo "You need to specify an environment"
    return 1
  end

  set -l envfile $__envctl_data_dir/$envname.env
  eval $EDITOR $envfile

  if [ "$envname" = "$__envctl_active_project" ]
    __envctl_activate $envname
    echo "Environment reloaded"
  end
end

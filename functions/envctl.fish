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

  __envctl_deactivate
  set -g __envctl_active_vars
  set -l index 1
  for line in (cat $envfile)
    set -l var_name (echo $line | cut -d = -f 1)
    set -l var_value (echo $line | cut -d = -f 2-)
    set __envctl_active_vars[$index] $var_name
    if set -q $var_name
      set -g __envctl_prev_$var_name $$var_name
    end
    set -xg $var_name $var_value
    set index (math "$index + 1")
  end
  set -g __envctl_active_project $envname
end

function __envctl_deactivate --description "Deactivate an environment"
  for var_name in $__envctl_active_vars
    set -l prev_var_name __envctl_prev_$var_name
    if set -q $prev_var_name
      set -xg $var_name $$prev_var_name
      set -e $prev_var_name
    else
      set -e $var_name
    end
  end
  set -e __envctl_active_vars
  set -e __envctl_active_project
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

function __envctl_debug --description "Print previous environment variables' values"
  for var_name in $__envctl_active_vars
    set -l prev_var_name __envctl_prev_$var_name
    if set -q $prev_var_name
      echo -s (set_color $fish_color_param) $var_name (set_color normal) "=" (set_color $fish_color_quote) $$prev_var_name (set_color normal)
    end
  end
end

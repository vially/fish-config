function __load_env_file --on-variable PWD --description 'Load environment variables from the .env file on directory change'
  status --is-command-substitution; and return

  if test -e .env
  	for line in (cat .env)
  	  set env_var_name (echo $line | cut -d = -f 1)
  	  set env_var_value (echo $line | cut -d = -f 2-)
  	  set -xg $env_var_name $env_var_value
  	end
  end
end
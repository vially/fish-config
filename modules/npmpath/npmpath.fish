function __autoset_npm_path --on-variable PWD --description 'Add `npm bin` to PATH on directory change'
  status --is-command-substitution; and return

  set npm_bin_path (npm bin)
  if begin; test -e $npm_bin_path; and not contains $npm_bin_path $PATH; end
		set -x PATH $npm_bin_path $PATH
  end
end

__autoset_npm_path

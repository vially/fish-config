function __autoset_npm_path --on-variable PWD --description 'Add `npm bin` to PATH on directory change'
  status --is-command-substitution; and return

  fixnpmpath
end

__autoset_npm_path

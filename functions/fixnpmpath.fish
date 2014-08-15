function fixnpmpath --description 'Add `npm bin` to PATH'
  set npm_bin_path (npm bin)
  if begin; test -e $npm_bin_path; and not contains $npm_bin_path $PATH; end
    set -x PATH $npm_bin_path $PATH
  end
end

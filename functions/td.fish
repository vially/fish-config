function td
  if test -f .taskproj
    set -l proj (cat .taskproj)
    task add project:$proj $argv
  else
    task add $argv
  end
end

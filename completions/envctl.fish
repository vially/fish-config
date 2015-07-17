set -l commands activate print edit

function __envctl_files_list
  set -l prefix $HOME/.local/share/envctl
  set -l files "$prefix"/**.env
  for file in $files
      set file (echo "$file" | sed "s#$prefix/\(.*\)\.env#\1#")
      echo "$file"
  end
end

# All envctl commands
complete -c envctl -f -A -n "not __fish_seen_subcommand_from $commands" -a "$commands"
complete -c envctl -f -A -n "not __fish_seen_subcommand_from $commands" -a activate -d 'Activate environment'
complete -c envctl -f -A -n "not __fish_seen_subcommand_from $commands" -a print -d 'Print environment'
complete -c envctl -f -A -n "not __fish_seen_subcommand_from $commands" -a edit -d 'Edit environment'

complete -c envctl -f -A -n "__fish_seen_subcommand_from activate" -a "(__envctl_files_list)"
complete -c envctl -f -A -n "__fish_seen_subcommand_from print" -a "(__envctl_files_list)"
complete -c envctl -f -A -n "__fish_seen_subcommand_from edit" -a "(__envctl_files_list)"

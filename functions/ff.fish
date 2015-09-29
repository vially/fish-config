function ff
	set -l name $argv[1]
    find . -type f -name "*$name*"
end

function whoowns
    set -l file_name $argv[1]
    if test -e $file_name
        set file_name (which $file_name)
    end
    pacaur -Qo $file_name
end

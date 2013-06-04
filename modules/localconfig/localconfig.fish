set local_conf_file ~/.config/fish/local.fish
if test -f $local_conf_file
    . $local_conf_file
end

function vi_key_bindings
    fish_vi_key_bindings
    bind \cl clear 'commandline -f repaint'
    bind -M insert \cl clear 'commandline -f repaint'
end

function fish_prompt --description "Write out the prompt"
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_hostcolor
        set -g __fish_prompt_hostcolor (set_color normal)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    set -g __fish_prompt_cwd (set_color normal)
    if set -q __fish_color_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    # virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end

    echo -s "$USER" @ "$__fish_prompt_hostcolor" "$__fish_prompt_hostname" "$__fish_prompt_normal" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" (__fish_git_prompt) ' $ '
end

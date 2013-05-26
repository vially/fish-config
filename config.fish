# virutalenv
. ~/.config/fish/virtual.fish

set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Prompt
function fish_prompt
    # virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end
    printf '%s@%s %s%s%s%s $ '  (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt)
end

# Disable greeting
set fish_greeting ""

# Aliases
alias dj='python manage.py'

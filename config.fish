# virutalenv
. ~/.config/fish/virtual.fish

# Git
set fish_git_dirty_color red

function parse_git_dirty 
         git diff --quiet HEAD ^&-
         if test $status = 1
            echo (set_color $fish_git_dirty_color)"Δ"(set_color normal)
         end
end
function parse_git_branch
         # git branch outputs lines, the current branch is prefixed with a *
         set -l branch (git branch --color ^&- | awk '/*/ {print $2}') 
         echo $branch (parse_git_dirty)     
end

# Prompt
function fish_prompt
    # virtualenv
    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
    end

    # git
    if test -z (git branch --quiet 2>&1| awk '/fatal:/ {print "no git"}')
        printf '%s@%s %s%s%s (%s) $ ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)            
    else
        printf '%s@%s %s%s%s $ '  (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    end 
end

# Disable greeting
set fish_greeting ""

# Aliases
alias dj='python manage.py'

# virutalenv
. ~/.config/fish/modules/virtualfish/virtual.fish
. ~/.config/fish/modules/autoenv/autoenv.fish
. ~/.config/fish/modules/localconfig/localconfig.fish

set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Disable greeting
set fish_greeting

# Aliases
alias dj='python manage.py'

# Variables
set -x EDITOR vim

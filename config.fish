. ~/.config/fish/modules/virtualfish/virtual.fish           # virtualenv
. ~/.config/fish/modules/virtualfish/auto_activation.fish   # virtualenv auto-activation
. ~/.config/fish/modules/autoenv/autoenv.fish               # autoload environment varialbes form .env file on directory change
. ~/.config/fish/modules/localconfig/localconfig.fish       # load local machine config from local.fish

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Disable greeting
set fish_greeting

# Aliases
alias dj='python manage.py'     # django alias
alias uncrustify-all='uncrustify -c uncrustify.cfg -l OC --no-backup (ffind "(\.h|\.m)\$")'

# Variables
set -x EDITOR vim               # vim FTW

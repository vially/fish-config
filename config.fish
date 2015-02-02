. ~/.config/fish/modules/virtualfish/virtual.fish           # virtualenv
. ~/.config/fish/modules/virtualfish/auto_activation.fish   # virtualenv auto-activation
. ~/.config/fish/modules/localconfig/localconfig.fish       # load local machine config from local.fish
eval (direnv hook fish)                                     # direnv integration

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Disable greeting
set fish_greeting

# Aliases
alias dj='python manage.py'     # django alias
alias fk='flake8 .'
alias uncrustify-all='uncrustify -c uncrustify.cfg -l OC --no-backup (ffind "(\.h|\.m)\$")'
alias tl='tarsnap --list-archives'
alias ge='env | grep -i'
alias pt='pt -S'
alias t='task'
alias gsh='gcloud compute ssh'
alias sc='systemctl'
alias scu='systemctl --user'
alias ssc='sudo systemctl'

# Variables
set -x EDITOR vim                                   # vim FTW
set -x GOPATH ~/.local/share/go                 # go FTW
set -x PATH ~/.local/bin $GOPATH/bin $PATH      # set PATH
set -x GNUPGHOME ~/.config/gnupg

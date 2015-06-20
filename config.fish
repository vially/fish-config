. ~/.config/fish/modules/virtualfish/virtual.fish           # virtualenv
. ~/.config/fish/modules/virtualfish/auto_activation.fish   # virtualenv auto-activation
. ~/.config/fish/modules/chruby/auto.fish                   # chruby auto-activation
. ~/.config/fish/modules/localconfig/localconfig.fish       # load local machine config from local.fish
eval (direnv hook fish)                                     # direnv integration

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Disable greeting
set fish_greeting

# Variables
set -x NPM_PACKAGES ~/.local/share/npm
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH
set -x NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
set -x EDITOR vim                                                   # vim FTW
set -x PATH ~/.local/bin $GOPATH/bin $NPM_PACKAGES/bin $PATH        # set PATH
set -x GNUPGHOME ~/.config/gnupg

# Aliases
alias dj='python manage.py'     # django alias
alias fk='flake8 .'
alias uncrustify-all='uncrustify -c uncrustify.cfg -l OC --no-backup (ffind "(\.h|\.m)\$")'
alias tl='tarsnap --list-archives'
alias ge='env | grep -i'
alias pt='pt -S'
alias t='task'
alias gsh='gcloud compute ssh'
alias sctl='sudo systemctl'
alias sctld='sudo systemctl daemon-reload'
alias sctli='sudo systemctl status'
alias sctlr='sudo systemctl restart'
alias sctlk='sudo systemctl stop'
alias scu='systemctl --user'
alias scud='systemctl --user daemon-reload'
alias scuk='systemctl --user stop'
alias scui='systemctl --user status'
alias scur='systemctl --user restart'
alias vim='nvim'
alias cg='cd $GOPATH'

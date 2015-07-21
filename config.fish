source ~/.config/fish/modules/virtualfish/virtual.fish           # virtualenv
source ~/.config/fish/modules/virtualfish/auto_activation.fish   # virtualenv auto-activation
source ~/.config/fish/modules/chruby/auto.fish                   # chruby auto-activation
source ~/.config/fish/modules/localconfig/localconfig.fish       # load local machine config from local.fish
source ~/.config/fish/modules/direnv/hook.fish                   # direnv integration

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# Disable greeting
set fish_greeting

# Enable vi-mode
vi_mode

# Variables
set -x NPM_PACKAGES ~/.local/share/npm
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH
set -x NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
set -x EDITOR vim                                                   # vim FTW
set -x PATH ~/.local/bin $GOPATH/bin $NPM_PACKAGES/bin $PATH        # set PATH
set -x GNUPGHOME ~/.config/gnupg

# Aliases
alias uncrustify-all='uncrustify -c uncrustify.cfg -l OC --no-backup (ffind "(\.h|\.m)\$")'
alias pt='pt -S'
alias t='task'
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

# Abbreviations
abbr -a cg='cd $GOPATH'
abbr -a dj='python manage.py'
abbr -a fk='flake8 .'
abbr -a ea='envctl activate'
abbr -a ep='envctl print'
abbr -a ee='envctl edit'
abbr -a ge='env | grep -i'
abbr -a gsh='gcloud compute ssh'
abbr -a gcl='gcloud compute instances list'
abbr -a gcdel='gcloud compute instances delete'
abbr -a tl='tarsnap --list-archives'
abbr -a vish='vim ~/.config/fish/config.fish'

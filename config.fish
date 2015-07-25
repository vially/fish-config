source ~/.config/fish/modules/virtualfish/virtual.fish           # virtualenv
source ~/.config/fish/modules/virtualfish/auto_activation.fish   # virtualenv auto-activation
source ~/.config/fish/modules/fishmarks/marks.fish               # fishmarks
source ~/.config/fish/modules/chruby/auto.fish                   # chruby auto-activation
source ~/.config/fish/modules/localconfig/localconfig.fish       # load local machine config from local.fish
source ~/.config/fish/modules/direnv/hook.fish                   # direnv integration

## Variables

# Disable greeting
set fish_greeting

# git prompt config
set __fish_git_prompt_showdirtystate 1
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate red

# npm
set -x NPM_PACKAGES ~/.local/share/npm
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH
set -x NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH

# generic
set -x EDITOR vim                                                   # vim FTW
set -x PATH ~/.local/bin $GOPATH/bin $NPM_PACKAGES/bin $PATH        # set PATH
set -x GNUPGHOME ~/.config/gnupg

# Aliases
alias pt='pt -S'
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
abbr -a sctl='sudo systemctl'
abbr -a sctld='sudo systemctl daemon-reload'
abbr -a sctli='sudo systemctl status'
abbr -a sctlr='sudo systemctl restart'
abbr -a sctlk='sudo systemctl stop'
abbr -a scu='systemctl --user'
abbr -a scud='systemctl --user daemon-reload'
abbr -a scuk='systemctl --user stop'
abbr -a scui='systemctl --user status'
abbr -a scur='systemctl --user restart'
abbr -a gg='go get'
abbr -a ggu='go get -u'

# Enable vi-mode
vi_mode

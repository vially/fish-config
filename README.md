# Fish shell configuration files

## Installation
```
    $ git clone https://github.com/vially/fish-config.git ~/.config/fish
    $ cd ~/.config/fish
    $ git submodule update --init
```

## Modules

The modules can be enabled by sourcing the module file from your `~/.config/fish/config.fish`
E.g.: `. ~/.config/fish/modules/autoenv/autoenv.fish`

### autoenv

Loads environment variables from an `.env` file on directory change

### localconfig

Loads fish configuration from: `~/.config/fish/local.fish`. Useful for storing local configuration options relevant only for the current machine.

### [virtualfish](https://github.com/adambrenecki/virtualfish)

A Fish Shell wrapper for Ian Bicking's virtualenv

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git osx brew vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

if [ -f ~/.sh_autostart ]; then
    . ~/.sh_autostart
fi

if [ -f ~/.sh_aliases ]; then
    . ~/.sh_aliases
fi


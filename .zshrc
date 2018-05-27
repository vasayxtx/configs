# Path to your oh-my-zsh configuration.

[[ -f ~/.zsh_params ]] && source ~/.zsh_params
[[ -z "$PROMPT_HEADER_COLOR" ]] && PROMPT_HEADER_COLOR="green"
[[ -z "$PROMPT_PATH_PREFIX" ]] && PROMPT_PATH_PREFIX=""
[[ -z "$PROMPT_PATH_COLOR" ]] && PROMPT_PATH_COLOR="blue"

ZSH_THEME="robbyrussell"

plugins=(git osx brew vi-mode laravel ssh-agent extract composer vagrant pip docker docker-compose tmux)
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


# History

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

bindkey "^R" history-incremental-search-backward


# Autocorrect

setopt correctall


# Env variables

export PATH=$PATH:/usr/sbin:/sbin
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export EDITOR="vim"     # Vim as default editor

export PROMPT="╭─%{$fg_bold[${PROMPT_HEADER_COLOR}]%}%n@%m%  %{$fg_bold[${PROMPT_PATH_COLOR}]%}${PROMPT_PATH_PREFIX}%~%{$reset_color%} \$(git_prompt_info)%{$reset_color%}
╰─%B$%b "
export RPROMPT='%(?..%{$fg_bold[red]%}[%?])%{$reset_color%}'

export GOPATH=$HOME/go

# Aliases

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -FG --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -FG'
fi

## Command short cuts to save time
# handy short cuts
alias c=clear
alias h='history'
alias j='jobs -l'

## Control ls command output
alias ll='ls -lah'              # Use a long listing format
alias l.='ls -A'                # Show hidden files (excluding '.' and '..')

## Control cd command behavior
alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Start calculator with math support
alias bc='bc -l'

## Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## vi as vim
alias vi=vim

## Add safety nets
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'     # Force deleting
alias rmrf='nocorrect rm -fR'   # Force recursive deleting
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias mkdir='nocorrect mkdir'
alias ln='ln -i'

# Getting size in human-readable format
alias du='du -h'
alias df='df -h'

# Autocomplete for hosts specified in the ~/.ssh/config
zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"


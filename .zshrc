[[ -z "$PROMPT_HEADER_COLOR" ]] && PROMPT_HEADER_COLOR="green"
[[ -z "$PROMPT_PATH_PREFIX" ]] && PROMPT_PATH_PREFIX=""
[[ -z "$PROMPT_PATH_COLOR" ]] && PROMPT_PATH_COLOR="blue"

ZSH_THEME="robbyrussell"

plugins=(
    brew
    docker
    docker-compose
    extract
    git
    golang
    helm
    kubectl
    minikube
    macos
    pip
    ssh-agent
    tmux
)
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable vi mode
bindkey -v

# History

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Up/Down arrow: search history with current input
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# Ctrl+R: incremental search backward
bindkey "^R" history-incremental-search-backward

# Env variables

export PATH=$HOME/dev/bin:$HOME/go/bin:$HOME/bin:/opt/homebrew/bin:$PATH

# Deduplicate $PATH entries
export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!a[$1]++' | sed 's/:$//')k

export EDITOR="vim"

export PROMPT="╭─%{$fg_bold[${PROMPT_HEADER_COLOR}]%}%n@%m%  %{$fg_bold[${PROMPT_PATH_COLOR}]%}${PROMPT_PATH_PREFIX}%~%{$reset_color%} \$(git_prompt_info)%{$reset_color%}
╰─%B$%b "
export RPROMPT='%(?..%{$fg_bold[red]%}[%?])%{$reset_color%}'


# Aliases

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -FG'
fi

## Command short cuts to save time
alias c=clear
alias h='history'

## Control ls command output
alias l="eza -1"       # List one entry per line
alias ll="eza -lah"    # List all files with human-readable sizes
alias lt="eza --tree"  # Tree view

## Control cd command behavior
alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

## vi as vim
alias vi=vim

## Add safety nets
alias rm='nocorrect rm -i'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias mkdir='nocorrect mkdir'
alias ln='ln -i'

# Getting size in human-readable format
alias du='du -h'
alias df='df -h'

# Use bat instead of cat/less
alias cat='bat --paging=never'
alias less='bat'

# Autocomplete for hosts specified in the ~/.ssh/config
[[ -r ~/.ssh/config ]] && zstyle ':completion:*:hosts' hosts $(grep '^Host ' ~/.ssh/config | awk '{print $2}')

# gvm
if [[ -s "~/.gvm/scripts/gvm" ]]; then
    source "~/.gvm/scripts/gvm"
fi

# atuin
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh)"
fi

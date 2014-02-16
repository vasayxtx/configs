# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git osx brew vi-mode laravel ssh-agent extract)

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
export PATH=$HOME/.composer/vendor/bin:$PATH
export EDITOR="vim"     # Vim as default editor

export PROMPT='╭─%{$fg_bold[green]%}%n@%m%  %{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info)%{$reset_color%}
╰─%B$%b '
export RPROMPT='%(?..%{$fg_bold[red]%}[%?])%{$reset_color%}'


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

## Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

## Show open ports
alias ports='netstat -tulanp'

## Debug web server / cdn problems with curl
# get web server headers
alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

## Add safety nets
alias rm='nocorrect rm -i'
alias rmf='nocorrect rm -f'     # Force deleting
alias rmrf='nocorrect rm -fR'   # Force recursive deleting
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias mkdir='nocorrect mkdir'
alias ln='ln -i'

# Continue getting a partially-downloaded file
alias wget='wget -c'

# Getting size in human-readable format
alias du='du -h'
alias df='df -h'

## Update Debian Linux server
# install with apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"
# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

## Work with demons
# Nginx
alias nginx-restart='sudo service nginx restart'
# php5-fpm
alias php-restart='sudo service php5-fpm restart'

## i3 tile manager
alias lockscreen="i3lock -c 000000"
alias logout="i3-msg exit"

## Laravel
alias art="php artisan"


# Global aliases

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'


# Other

if [ -f ~/.sh_autostart ]; then
    . ~/.sh_autostart
fi


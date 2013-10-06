## Using: add like this to .bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -F --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -F'
fi

## Command short cuts to save time
# handy short cuts
alias g=git
alias c=clear
alias h='history'
alias j='jobs -l'

## Control ls command output
# Use a long listing format ##
alias ll='ls -la'
# Show hidden files ##
alias l.='ls -a'

## Control cd command behavior
# get rid of command not found ##
alias cd..='cd ..'
# a quick way to get out of current directory ##
alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## start calculator with math support
alias bc='bc -l'

## Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

## Set vim as default
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

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
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

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


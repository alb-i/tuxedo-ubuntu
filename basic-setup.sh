#!/bin/bash

echo "creating some directories"

mkdir -p "$HOME/bin" 
mkdir -p "$HOME/tmp/git" 
mkdir -p "$HOME/local"
mkdir -p "$HOME/var"
mkdir -p "$HOME/env"
mkdir -p "$HOME/git"

echo "installing goodies..."

sudo apt -y install git zsh xclip wget

cd $HOME/tmp
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

echo "Is this suspicious?"
cat install.sh

echo "15 seconds until it is going to be run..."
sleep 15
sh install.sh

sed 's/ZSH_THEME=.*/ZSH_THEME="ys"/;s/# HYPHEN_INSENSITIVE=.*/HYPHEN_INSESITIVE=true/;s/plugins=(.*)/plugins=(git pass docker)/' -i $HOME/.zshrc
echo "source $HOME/.myaliases" >> .zshrc

cat /dev/stdin > $HOME/.myaliases <<EOF
alias push="git push"
alias pull="git pull"
alias status="git status"
alias add="git add"
alias commit="git commit"

alias open=xdg-open
alias pbcopy="xclip -i -selection clipboard"
alias pbpaste="xclip -o -selection clipboard"

bindkey '^R' history-incremental-pattern-search-backward

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export VISUAL=vim
export EDITOR=vim

copypwd () {
  /usr/bin/keyring get $1 $2 | pbcopy
}

showpwd () {
  /usr/bin/keyring get $1 $2
}

setpwd () {
  /usr/bin/keyring set $1 $2
}

activate () {
        if  [ -e "./$1/bin/activate" ] ; then
                source "./$1/bin/activate" 
        else
        if  [ -e "./$1/activate" ] ; then
                source "./$1/activate" 
        else
        if  [ -e "./$1/activate.env" ] ; then
                source "./$1/activate.env" 
        else
        if  [ -e "$HOME/env/$1/bin/activate" ] ; then
                source "$HOME/env/$1/bin/activate" 
        else
        if  [ -e "$HOME/env/$1/activate" ] ; then
                source "$HOME/env/$1/activate" 
        else
        if  [ -e "$HOME/env/$1/activate.env" ] ; then
                source "$HOME/env/$1/activate.env" 
        else
        fi
        fi
        fi
        fi
        fi
        fi
}

EOF

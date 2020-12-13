#!/bin/bash

echo "creating some directories"

mkdir -p "$HOME/bin" 
mkdir -p "$HOME/tmp/git" 
mkdir -p "$HOME/local"
mkdir -p "$HOME/var"
mkdir -p "$HOME/env"
mkdir -p "$HOME/git"

echo "installing goodies..."

sudo apt -y install git zsh 


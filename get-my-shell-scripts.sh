#!/bin/bash

mkdir -p $HOME/tmp/git
mkdir -p $HOME/bin

cd $HOME/tmp/git

git clone https://github.com/alb-i/shell-scripts

cp shell-scripts/bin/* $HOME/bin

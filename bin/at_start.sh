#!/bin/sh
# author:combofish
# email:combofish49@gmail.com
# Filename: at_start.sh

oneko_path=/home/larry/GitProjectsForWatch/oneko

cd $oneko_path
./oneko -bg red -fg white -speed 14 -bsd 2>&1 >/dev/null &

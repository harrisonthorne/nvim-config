#!/usr/bin/env bash

cmd="pandoc ${@:2} \"$1\" -o \"$1.pdf\" --wrap=preserve && pkill -HUP mupdf" 
echo $cmd

bash -c "$cmd"

zathura "$1.pdf" &

echo "$1" | entr -n bash -c "$cmd"

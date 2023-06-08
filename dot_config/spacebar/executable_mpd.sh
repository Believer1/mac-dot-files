#!/bin/bash

res=$(~/.config/spacebar/nowplaying-cli get title artist | tr '\n' '/' | rev | cut -c2- | rev)

file_path="/Users/haimkortovich/.config/spacebar/.current_song"

song=$(<$file_path) || true

if [ "$song" != "$res" ]; then
    /Users/haimkortovich/.config/spacebar/notify $res
    echo $res > $file_path
fi

echo $res

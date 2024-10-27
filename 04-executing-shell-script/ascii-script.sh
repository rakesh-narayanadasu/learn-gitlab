#!/usr/bin/env bash

echo "Generate ASCII Artwork using COWSAY Program"
cowsay -f dragon "Run for cover, I am a DRAGON....RWAR" >> dragon.txt
grep -i "dragon" dragon.txt
cat dragon.txt
ls -la
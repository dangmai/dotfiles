#!/bin/sh
# Recursively expand
# Example: rexpand "*.php"
# Remember to use "" to prevent globbing
find . -name "$1" | while read line
do
    expand --tabs=4 $line > $line.tmp
    mv $line.tmp $line
done
#!/bin/bash

echo "All variables passed to the script :$@"
echo "No. of variables passed: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "home directory of current user : $HOME"
echo "PID of the script executing now: $$"

sleep 100 &
echo "PID of last background command: $!"
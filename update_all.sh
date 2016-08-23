#!/bin/bash

# store the current dir. This contains all repositories
CUR_DIR=$(pwd)

# Output what the script is doing to the console
echo -e "\n\033[1mPulling in latest changes for all repositories...\033[0m\n"

# Find all git repositories and update it to the master latest revision
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";
    echo "\033[33m"+$i+"\033[0m";

    # Navigate to .git parent directory and pull all
    cd "$i";
    cd ..;

    # Pull all branches from the remote repository
    for b in `git branch -r | grep -v -- '->'`; do git branch --track ${b##origin/} $b; done
    git pull --all;

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo -e "\n\033[32mComplete!\033[0m\n"
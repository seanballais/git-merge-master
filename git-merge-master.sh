#!/bin/bash

merge() {
    git checkout develop
    git merge --no-ff $1
    git push origin develop
    git checkout master
    git merge --no-ff develop
    git push origin master
    echo "And we are done! Yey!"
}

check_branch() {
    if [`git branch --list $arg1`]; then
        echo "Merging $arg1 with master and develop..."

        merge $arg1
    else
        echo "Branch ($arg1) doesn't exit. Exiting now..."
        set -e
    fi
}

# Locate the help argument before continuing
for arg in "$@"
do
    if [$arg -eq "-h" || $arg -eq "--help"]; then
        echo "Usage: git-merge-master <branch name>..."
        kill -9 ${ps -A}
    fi
done

# Now process the input
if ["$#" -eq 0]; then
    read -p "What branch to merge with master and develop? " branch
    check_branch $branch
else
    for branch in "$@"
    do
        check_branch $branch
    done
fi

kill -9 ${ps -A}

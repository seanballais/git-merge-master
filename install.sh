#!/bin/bash

mkdir -p ~/.git-merge-master/
cp git-merge-master.sh ~/.git-merge-master/

chmod +x ~/.git-merge-master/git-merge-master.sh

# Now, let's make an alias for git-merge-master in Bash
echo "alias git-merge-master='~/.git-merge-master/git-merge-master.sh'" >> ~/.bashrc

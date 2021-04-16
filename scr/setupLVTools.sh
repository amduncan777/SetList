#!/bin/bash
# setupLVTool.sh
# ZSS, 2014-08-19
# Script to automatically setup LV Tools for use with git bash

# Create ~/bin if it doesn't already exist
mkdir -p ~/bin

# Setup LVCompare as a difftool with alias difflv
cp scr/lvcompareWrapper.sh ~/bin
git config --global difftool.LVCompare.cmd '~/bin/lvcompareWrapper.sh "$LOCAL" "$REMOTE"'
git config --global --replace-all alias.difflv "difftool --tool=LVCompare"

# Setup the LVMerge command as a mergetool with alias mergelv
cp scr/lvmergeWrapper.sh ~/bin
git config --global mergetool.LVMerge.cmd '~/bin/lvmergeWrapper.sh "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
git config --global mergetool.LVMerge.trustExitCode false
git config --global --replace-all alias.mergelv "mergetool --tool=LVMerge"

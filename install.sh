#!/bin/sh
set -eu

# synchronize desired to gitdrive, no delete
FOLDER="$HOME/gitops/${GITOPS_SYSTEM:-system}/${DRIVE:-gitdrive}"
mkdir -p "$FOLDER"
rsync -av desired/ "$FOLDER"/

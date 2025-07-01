#!/bin/sh
set -eu

# verify actual matches desired
FOLDER="$HOME/gitops/${GITOPS_SYSTEM:-system}/${DRIVE:-gitdrive}"
rsync -av --delete "$FOLDER"/ actual/
diff -qr actual desired > system.diff
[ -s "system.diff" ] && exit 1
exit 0
#!/bin/sh

# shellcheck disable=SC2086
for i in $(seq $1 $2); do
  git branch sys-"$i"/main
  git tag sys-"$i"/start
done

git push -f --all origin
git push -f --tags origin

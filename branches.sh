#!/bin/sh

# create new
for i in $(seq 1 $1); do
  git branch sys-"$i"/main
  git tag sys-"$i"/start
done

git push -f --all origin
git push -f --tags origin

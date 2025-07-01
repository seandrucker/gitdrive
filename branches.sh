#!/bin/sh

i=1
while [ "$i" -le 100 ]; do
  branch="sys-$i/main"
  git branch "$branch"
  git tag "sys-$i"/start
  i=$((i + 1))
done

git push --all origin
git push --tags -f origin

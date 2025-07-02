#!/bin/sh

# cleanup remotes
git ls-remote --heads origin | grep 'refs/heads/sys-' | cut -f2 | xargs git push origin --delete
git ls-remote --tags origin | grep -v '\^{}' | grep 'refs/tags/sys-' | cut -f2 | xargs git push origin --delete

# cleanup local
git branch --format='%(refname:short)' | grep '^sys-' | xargs git branch -d
git tag | grep '^sys-' | xargs git tag -d

# seq 1 "$1" | xargs -I{} echo sys-{}/main | xargs git push origin --delete
# seq 1 1000 | xargs -I{} echo sys-{}/main | xargs git branch
# seq 1 "$1" | xargs -I{} echo sys-{}/desired | xargs git push origin --delete

# seq 1 "$1" | xargs -I{} echo sys-{}/start | xargs git push origin --delete tag
# seq 1 "$1" | xargs -I{} echo sys-{}/agent | xargs git push origin --delete tag

# create new
for i in $(seq 1 $1); do
  git branch sys-"$i"/main
  git tag sys-"$i"/start
done

git push -f --all origin
git push -f --tags origin

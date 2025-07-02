#!/bin/sh

# cleanup remotes
git ls-remote --heads origin | grep 'refs/heads/sys-' | cut -f2 | xargs git push origin --delete
git ls-remote --tags origin | grep -v '\^{}' | grep 'refs/tags/sys-' | cut -f2 | xargs git push origin --delete

# cleanup local
git branch --format='%(refname:short)' | grep '^sys-' | xargs git branch -d
git tag | grep '^sys-' | xargs git tag -d

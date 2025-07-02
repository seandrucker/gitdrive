# GitDrive

Base repo

```sh
# creates branches and start tags.
./branches.sh
```



## SSH
Connecting over SSH corrects issues with testing that arise from overloading of the credential provider.

```sh
ls -al ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"

# check ssh agent running
eval "$(ssh-agent -s)"
```

### Mac OS
```sh
# add below 
nano ~/.ssh/config
```

If no passphrase:
```
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
```

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

## Add
```sh
pbcopy < ~/.ssh/id_ed25519.pub
```
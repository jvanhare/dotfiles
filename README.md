# DOTFILES

# Installing the dotfiles

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh jvanhare
```

## INRIA configuration

### Mounting the NAS

1. Create the gamma group with GID: 21135
2. Replace the UID
3. Change all the permissions:

```sh
find / -user OLD_UID -exec chown NEW_UID {} \;
find / -group OLD_GID -exec chgrp NEW_GID {} \;
```

4. Uncomment `/net` in `/etc/auto_master` and:

```sh
automount -cv
```

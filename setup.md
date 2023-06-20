# Setting a password on steam deck

```bash
    passwd
```

# Unlocking filesystem

```bash
    sudo steamos-readonly disable
```

## lock it back 

```bash
    sudo steamos-readonly enable
```

# Start ssh server

```bash
    sudo systemctl start sshd
    sudo systemctl enable sshd
```

## disable ssh server

```bash
    sudo systemctl stop sshd
    sudo systemctl disable sshd
```

# Install nix

using a single user install in order to simplify potential reinstall due to steam deck update behavior

```bash
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## uninstall nix

```bash
    sudo rm -fr /nix
```
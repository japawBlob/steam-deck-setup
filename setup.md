# Setting a password on steam deck

```bash
    passwd
```

# Install nix

Create file in /etc/systemd/system/ensure-nix-dir.service

with contents:

```bash
[Unit]
Description=Create /nix if it is missing

[Service]
Type=oneshot
ExecStart=/usr/bin/bash -c "if ! [[ -d /nix ]]; then \
              steamos-readonly disable; \
              mkdir -m 0755 /nix; \
              chown deck: /nix; \
              steamos-readonly enable; \
              fi"

# No [Install] section, meant to be run by nix.mount
```
Create file in /etc/systemd/system/nix.mount

with contents:
```
[Unit]
Description=Mount /nix from /home/deck/.nix
After=local-fs.target home.mount ensure-nix-dir.service
Wants=ensure-nix-dir.service
[Mount]
Options=bind,nofail
Type=none
What=/home/deck/.nix
Where=/nix
[Install]
WantedBy=multi-user.target
```

Install nix:

```bash
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

## uninstall nix

```bash
    sudo rm -fr /nix
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



## uninstall nix

```bash
    sudo rm -fr /nix
```

# Set flatpak to darkmode

```bash
    flatpak install Adwaita-dark
    flatpak override --user --env=GTK_THEME=Adwaita-dark
```

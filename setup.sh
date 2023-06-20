# set sudo password
passwd
# start ssh server
sudo systemctl start sshd
sudo systemctl enable sshd
# install nix
sudo steamos-readonly disable
sh <(curl -L https://nixos.org/nix/install) --no-daemon
sudo steamos-readonly enable
# nixos-wsl-example

Simple NixOS-WSL configuration with home-manager.

- An existing nix installation is needed to build the installation tarball
- Clone this repo and modify the hostname and username as needed (in `configuration.nix` or `flake.nix`)

```console
nix build .#nixosConfigurations.HOSTNAME.config.system.build.installer
# Tarball will be under result/tarball/nixos-wsl-installer.tar.gz
# (copy to the windows machine)
wsl --import NixOS .\NixOS\ nixos-wsl-installer.tar.gz --version 2
wsl -d NixOS
```

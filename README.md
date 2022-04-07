# nixos-wsl-example

Simple NixOS-WSL configuration with home-manager.

To install, build the tarball with a existing nix installation (change the hostname and username in `flake.nix` and `configuration.nix` as needed).

```console
nix build .#nixosConfigurations.HOSTNAME.config.system.build.installer
# Tarball will be under result/tarball/nixos-wsl-installer.tar.gz
# (copy to the windows machine)
wsl --import NixOS .\NixOS\ nixos-wsl-installer.tar.gz --version 2
wsl -d NixOS
```

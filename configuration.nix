{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  hostname = "HOSTNAME";
  username = "nixos";
in {
  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = username;
    startMenuLaunchers = false;
    wslConf.network.hostname = hostname;
  };

  networking.hostName = hostname;

  system.stateVersion = "21.11";
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    sharedModules = [
      {
        home.stateVersion = lib.mkForce config.system.stateVersion;
      }
    ];

    users.${username} = import ./home.nix;
  };
}

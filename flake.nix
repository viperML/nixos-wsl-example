{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations.HOSTNAME = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        inputs.nixos-wsl.nixosModules.wsl
        inputs.home-manager.nixosModules.home-manager
        "${inputs.nixpkgs}/nixos/modules/profiles/minimal.nix"
        ./configuration.nix
      ];
    };
  };
}

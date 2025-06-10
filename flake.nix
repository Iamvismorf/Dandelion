{
  description = "system flake";
  inputs = {
    nixpkgs = {
      # url = "github:nixos/nixpkgs/nixos-unstable";
      url = "github:nixos/nixpkgs/nixos-25.05";
    };
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ args: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}; #do I need to change this?
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit args;
        inherit system;
      };
      modules = [
        ./nixos/configuration.nix
        stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.vismorf = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit args;
        inherit system;
      };
      modules = [
        ./home-manager/home.nix
        stylix.homeModules.stylix
      ];
    };
  };
}

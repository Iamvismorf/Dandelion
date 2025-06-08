{
	description = "system flake";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		hyprland.url = "github:hyprwm/Hyprland";
		stylix.url = "github:danth/stylix";
	};

	outputs = {self, nixpkgs, home-manager, stylix, ...}@args:
		let 
		system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system}; #do I need to change this?
	in
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem{
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

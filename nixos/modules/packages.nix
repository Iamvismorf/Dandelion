{pkgs, config, ...}:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	  neovim
	  home-manager
	  libnotify
	  playerctl
	  brightnessctl
	  wl-clipboard
	  openrgb-with-all-plugins
	  
  ];

}

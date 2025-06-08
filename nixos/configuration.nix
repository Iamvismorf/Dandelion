# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, args, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	      ./modules/bootloader.nix
	      ./modules/users.nix
	      ./modules/pipewire.nix
	      ./modules/automation.nix
	      ./modules/displayManager.nix
	      ./modules/wm.nix
	      ./modules/packages.nix
	      ./modules/settings.nix

    ];
      services.playerctld.enable = true;
  services.hardware.openrgb.enable = true;

  # Enable networking
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.


  # firewall
  networking.firewall.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  #
  # # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  # };
  #





  system.stateVersion = "24.11"; # Did you read the comment?

}

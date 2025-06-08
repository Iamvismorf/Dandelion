{
  # Bootloader.
  boot.loader = {
	  timeout=null;
	  efi.canTouchEfiVariables = true;
	  systemd-boot = {
		  enable = true;
		  configurationLimit = 3;
		  extraEntries."fedora.conf" = ''
			  title Fedora
			  efi /efi/fedora/grubx64.efi
		  '';
	  };
  };
  # boot.loader = {
  #  efi.canTouchEfiVariables = true;
  #  grub = {
  #   enable = true;
  #   device = "nodev";
  #   efiSupport = true;
  #   useOSProber = true;
  #  };
  # };
}

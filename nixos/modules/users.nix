{pkgs, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vismorf = {
    isNormalUser = true;
    description = "vsmrf";
    extraGroups = [ 
	    "networkmanager" 
	    "wheel" 
	    "input" 
    ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
}

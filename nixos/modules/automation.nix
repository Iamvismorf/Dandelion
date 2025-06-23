{
  config,
  args,
  ...
}: {
  # garbage
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # autoupdate
  system.autoUpgrade = {
    enable = true;
    # flake = "path:${config.homeDirectory}/system/";
    flake = "github:Iamvismorf/Dandelion";
    dates = "weekly";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    randomizedDelaySec = "45min";
  };
}

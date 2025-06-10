{
  pkgs,
  config,
  args,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    # set the flake package
    package = args.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = args.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = with pkgs; {
    enable = true;
    extraPortals = [
      kdePackages.xdg-desktop-portal-kde
      #no need for hyprland because is enabled by programs.hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.wayland
    libsForQt5.qt5.qtwayland
    hyprpolkitagent
  ];
}

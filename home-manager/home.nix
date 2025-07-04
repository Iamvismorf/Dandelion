{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vismorf";
  home.homeDirectory = "/home/vismorf";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  imports = [
    # ./modules/style.nix
    ./modules/packages.nix
    ./modules/starship.nix
    ./modules/nh.nix
    ./modules/nixcats/default.nix
    ./modules/ghostty/ghostty.nix
    ./modules/yazi/yazi.nix
    ./modules/firefox/firefox.nix
    ./modules/git.nix
    ./modules/xdg.nix
    ./modules/btop.nix
    ./modules/stylix.nix
    ./modules/fuzzel.nix
    ./modules/fastfetch/fastfetch.nix
    ./modules/waybar/waybar.nix
    ./zsh.nix
  ];

  wayland.windowManager.hyprland.systemd.enable = false;

  home.sessionVariables = {
    EDITOR = "vixmeow";
    VISUAL = "vixmeow";
    #NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland";
    OZONE_PLATFORM = "wayland";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

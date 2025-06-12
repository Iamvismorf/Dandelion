{
  lib,
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    # gtk.enable = true;
    package = pkgs.kdePackages.breeze;
    name = "Breeze_Light";
    size = 18;
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = lib.mkForce "Breeze-Dark";
      icon-theme = lib.mkForce "Papirus-Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "breeze";
    style = {
      name = "Breeze";
      package = pkgs.kdePackages.breeze;
    };
  };
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    font = {
      name = "AtkinsonHyperlegible-Medium";
      size = 11;
    };
    theme = {
      package = pkgs.kdePackages.breeze-gtk;
      name = "Breeze-Dark";
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Atkinson Hyperlegible Next"];
        sansSerif = ["Atkinson Hyperlegible Next"];
        monospace = ["Atkinson Hyperlegible Next"];
      };
    };
  };
  home.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    font-awesome
    material-symbols
    papirus-icon-theme
    atkinson-hyperlegible-next
    kdePackages.qt6ct
    libsForQt5.qt5ct
  ];
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix.enable = true;
  stylix.autoEnable = true; # whether to apply to .target.<target> automatically
  stylix.targets = {
    ghostty.enable = false;
    firefox = {
      enable = true;
      profileNames = ["vismorf"];
      colorTheme.enable = false;
    };
    neovim = {
      enable = false;
      plugin = false;
    };
    yazi.enable = false;

    # fuzzel.enable = true;
    # gtk.enable = true;
    # qt.enable = true;
  };

  stylix.cursor = {
    package = pkgs.kdePackages.breeze;
    name = "Breeze_Light";
    size = 24;
  };

  stylix.fonts = {
    serif = {
      package = pkgs.atkinson-hyperlegible-next;
      # name = "AtkinsonHyperlegibleNext-Medium";
      name = "Atkinson Hyperlegible Next Medium";
    };
    sansSerif = {
      package = pkgs.atkinson-hyperlegible-next;
      # name = "AtkinsonHyperlegibleNext-Medium";
      name = "Atkinson Hyperlegible Next Medium";
    };
    monospace = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
    };
    # emoji = {
    #   package = pkgs.noto-fonts-emoji;
    #   name = "Noto Color Emoji";
    # };
    sizes = {
      applications = 10;
      desktop = 10;
      popups = 10;
    };
  };

  stylix.iconTheme = {
    enable = true;
    dark = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };
  stylix.polarity = "dark";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
  stylix.base16Scheme = ./theme.yaml;
}

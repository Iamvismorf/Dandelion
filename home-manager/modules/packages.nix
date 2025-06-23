{
  pkgs,
  config,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    #fonts
    nerd-fonts.hack
    nerd-fonts.symbols-only
    # nerd-fonts.jetbrains-mono
    font-awesome
    material-symbols
    papirus-icon-theme
    atkinson-hyperlegible-next

    kdePackages.qt6ct
    libsForQt5.qt5ct

    #aesthetics
    swww
    waypaper
    hyprpicker
    kdePackages.dolphin

    fuzzel
    firefox
    waybar
    
    #screenshot
    grim
    slurp
    hyprshot
    hyprpicker


    # terminal
    wtype
    socat
    wget
    ripgrep
    fzf
    git
    ghostty
    eza
    jq
    fd
    bat
    tree
    starship
    peaclock
    fum
    btop
    rocmPackages.amdsmi

    # file manager
    yazi

    # util
    viewnior
    mpv
    (equibop.overrideAttrs (oldAttrs: {
      desktopItems = oldAttrs.desktopItems.override {icon = "discord";};
    }))
  ];
}

{
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/menu"
          "hyprland/workspaces"
          "hyprland/window"
          "custom/window-state"
          "tray"
        ];
      };
    };
  };
}

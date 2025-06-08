{pkgs, config, ...}:
{
#display manager
#programs.regreet.enable = true;
services.greetd = {
  enable = true;
  package = pkgs.greetd.tuigeet;
  settings = {
    default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet  --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --user-menu -t -r --window-padding 2 --asterisks -g clown --cmd 'uwsm start hyprland-uwsm.desktop'";
      user = "greeter";
    };
  };
};

}

{
  pkgs,
  config,
  ...
}: {
  programs.yazi = {
    flavors = {
      kanso-ink = ./flavors/kanso-ink;
    };
    theme = {
      flavor = {
        dark = "kanso-ink";
      };
    };
    enableZshIntegration = true;
    enable = true;
    settings.mgr = {
      show_hidden = true;
    };
    settings.opener.edit = [
      {
        run = "${config.home.sessionVariables.EDITOR} \"$@\"";
        block = true;
      }
    ];
  };
}

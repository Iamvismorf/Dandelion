{
  pkgs,
  config,
  ...
}: {
  programs.yazi = {
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

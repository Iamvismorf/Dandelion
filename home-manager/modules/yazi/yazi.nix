{
  pkgs,
  config,
  ...
}: {
  programs.yazi = {
    plugins = with pkgs; {
      relative-motions = yaziPlugins.relative-motions;
    };
    initLua = ./init.lua;
    keymap = {
      mgr.prepend_keymap = [
        {
          on = ["1"];
          run = "plugin relative-motions 1";
        }
        {
          on = ["2"];
          run = "plugin relative-motions 2";
        }
        {
          on = ["3"];
          run = "plugin relative-motions 3";
        }

        {
          on = ["4"];
          run = "plugin relative-motions 4";
        }

        {
          on = ["5"];
          run = "plugin relative-motions 5";
        }

        {
          on = ["6"];
          run = "plugin relative-motions 6";
        }

        {
          on = ["7"];
          run = "plugin relative-motions 7";
        }

        {
          on = ["8"];
          run = "plugin relative-motions 8";
        }

        {
          on = ["9"];
          run = "plugin relative-motions 9";
        }
      ];
    };
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

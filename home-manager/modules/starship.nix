{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      line_break.disable = true;
      cmd_duration.disabled = true;
      add_newline = true;
      format = "$git_branch$directory$character";
      directory = {
        # style = "fg:#769ff0";
        style = "blue";
        truncation_length = 0;
        truncate_to_repo = false;
        read_only = "  ";
        read_only_style = "red";
        # read_only_style = "#f7768e";
        format = "[$read_only]($read_only_style) [$path]($style) ";
      };
      git_branch = {
        style = "purple";
      };
      character = {
        error_symbol = "[✗](red)";
        success_symbol = "[❯](green)";
      };
    };
  };
}

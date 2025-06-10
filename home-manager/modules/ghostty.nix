{lib, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = lib.mkForce "Hack Nerd Font";
      font-style = "bold";
      font-size = 12;
      adjust-cell-height = "20%";
      link-url = false;
      theme = "yugen";
    };
    themes = {
      yugen = {
        background = "#0c0c0c";
        foreground = "#d4d4d4";
        cursor-color = "#D4D4D4";
        cursor-text = "#0c0c0c";
        selection-background = "#303030";
        selection-foreground = "#D4D4D4";
        palette = [
          "0=#0c0c0c"
          "8=#505050"

          # blue
          "4=#729af0"
          "12=#729af0"

          # cyan but blue
          "6=#729af0"
          "14=#729af0"

          # silver and white
          "7=#d4d4d4"
          "15=#fafafa"

          # green
          #2=#3ba55b
          #10=#3ba55b

          "2=#00a800"
          "10=#00a800"

          # red
          #1=#ff2d2d
          #9=#ff2d2d

          "1=#d83a42"
          "9=#d83a42"

          # yellow
          "3=#d6a432"
          "11=#d6a432"

          #3=#dc8750
          #11=#dc8750
        ];
      };
    };
  };
}

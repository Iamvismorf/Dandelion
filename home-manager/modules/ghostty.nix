{lib, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = lib.mkForce "Hack Nerd Font";
      font-style = "bold";
      font-style-italic = false;
      font-style-bold-italic = false;
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
        # cursor-text = "#0c0c0c";
        selection-background = "#303030";
        selection-foreground = "#D4D4D4";
        palette = [
          "0=#0c0c0c"
          "1=#d83a42"
          "2=#00a800"
          "3=#dc8750"
          "4=#dc8750"
          "6=#729af0"
          "7=#d4d4d4"
          "8=#505050"
          "9=#d83a42"
          "10=#00a800"
          "11=#dc8750"
          "12=#dc8750"
          "14=#729af0"
          "15=#fafafa"

          # blue

          # cyan but blue

          # silver and white

          # green
          #2=#3ba55b
          #10=#3ba55b

          # red
          #1=#ff2d2d
          #9=#ff2d2d

          # yellow

          #3=#dc8750
          #11=#dc8750
        ];
      };
    };
  };
}

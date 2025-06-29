{lib, ...}: {
  # home.file.".config/ghostty/shaders" = {
  #   source = ./shaders;
  #   # recursive = true;
  # };

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = lib.mkForce "Hack Nerd Font";
      font-style = "bold";
      font-style-italic = false;
      font-style-bold-italic = false;
      font-size = 12;
      adjust-cell-height = "20%";
      gtk-single-instance = true;
      link-url = false;
      theme = "kanso-ink";
      # custom-shader = "shaders/cursor-smear.glsl";
    };
    themes = {
      kanso-ink = {
        palette = [
          "0=#14171d"
          # "1=#c4746e"
          "1=#e06c75"
          "2=#8a9a7b"
          "3=#c4b28a"
          "4=#8ba4b0"
          "5=#a292a3"
          "6=#8ea4a2"
          "7=#a4a7a4"
          "8=#5C6066"
          # "9=#e46876"
          "9=#e06c75"
          "10=#87a987"
          "11=#e6c384"
          "12=#7fb4ca"
          "13=#938aa9"
          "14=#7aa89f"
          "15=#c5c9c7"
        ];
        background = "#14171d";
        foreground = "#c5c9c7";
        cursor-color = "#c5c9c7";
        selection-background = "#3E424A";
        selection-foreground = "#c5c9c7";
      };
    };
  };
}

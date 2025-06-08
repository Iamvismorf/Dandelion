{lib, pkgs, ...}:
{
  programs.btop = with pkgs; {
    enable = true; 
    settings = {
      #color_theme = "tokyo-night";
      #color_theme = "ayu";
      rounded_corners = false;
      vim_keys = true;
      shown_boxes = "proc cpu mem net gpu0";
    };  
  };



}

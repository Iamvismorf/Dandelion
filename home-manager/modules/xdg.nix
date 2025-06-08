{ config, lib, ...}:
{
  xdg.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/*" = ["nvim.desktop"];
    "application/pdf" = ["firefox.desktop"];
    "image/*" = ["viewnior.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
    "inode/directory" = "yazi.desktop";
    "x-scheme-handler/file" = "yazi.desktop";
    "x-scheme-handler/folder" = "yazi.desktop";
  };
  xdg.mimeApps.enable = true;
  #no idea what this does 
  xdg.configFile."mimeapps.list".enable = false;
  xdg.dataFile."applications/mimeapps.list".force = true;
  #xdg.mimeApps.enable = lib.mkDefault true;
  #xdg.configFile."mimeapps.list" = lib.mkIf config.xdg.mimeApps.enable { force = true; };
}

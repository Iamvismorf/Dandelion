{pkgs, lib, config, ...}:
let
 configFilePath = "/home/vismorf/system/home-manager/modules/fastfetch/config.jsonc";
 configSrc = config.lib.file.mkOutOfStoreSymlink configFilePath;
in

{
   programs.fastfetch = {
      enable = true;
   };
   home.file.".config/fastfetch/config.jsonc".source = configSrc;
}

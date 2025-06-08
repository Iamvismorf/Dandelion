{
  pkgs,
  lib,
  config,
  ...
}: let
  configDirPath = "${config.home.homeDirectory}/system/home-manager/modules/neovim/nvim";
  configSrc = config.lib.file.mkOutOfStoreSymlink configDirPath;
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };
  home.file.".config/nvim" = {
    source = configSrc;
  };
  # linters, formatter, lsp
  home.packages = with pkgs; [
    # build deps
    gcc
    gnumake
    tree-sitter

    nodejs

    # lsp
    typescript-language-server
    lua-language-server
    nixd
    emmet-ls

    # formatters
    eslint_d
    prettierd
    alejandra
    stylua
  ];
}

{
  config,
  lib,
  args,
  ...
}: let
  utils = args.nixCats.utils;
in {
  imports = [
    args.nixCats.homeModule
  ];
  config = {
    # this value, nixCats is the defaultPackageName you pass to mkNixosModules
    # it will be the namespace for your options.
    nixCats = {
      enable = true;
      # nixpkgs_version = inputs.nixpkgs;
      # this will add the overlays from ./overlays and also,
      # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
      # It will not apply to overall system, just nixCats.
      addOverlays =
        # (import ./overlays inputs) ++
        [
          (utils.standardPluginOverlay args)
        ];
      # see the packageDefinitions below.
      # This says which of those to install.
      packageNames = ["vixmeow"];

      luaPath = ./nvim;

      # the .replace vs .merge options are for modules based on existing configurations,
      # they refer to how multiple categoryDefinitions get merged together by the module.
      # for useage of this section, refer to :h nixCats.flake.outputs.categories
      categoryDefinitions.replace = {
        pkgs,
        settings,
        categories,
        extra,
        name,
        mkPlugin,
        ...
      } @ packageDef: {
        # to define and use a new category, simply add a new list to a set here,
        # and later, you will include categoryname = true; in the set you
        # provide when you build the package using this builder function.
        # see :help nixCats.flake.outputs.packageDefinitions for info on that section.

        # lspsAndRuntimeDeps:
        # this section is for dependencies that should be available
        # at RUN TIME for plugins. Will be available to PATH within neovim terminal
        # this includes LSPs
        lspsAndRuntimeDeps = {
          general = with pkgs; [
            fzf
            fd
            ripgrep
          ];
          lua = with pkgs; [
            lua-language-server
            stylua
          ];
          nix = with pkgs; [
            nixd
            alejandra
          ];
          hypr = with pkgs; [
            hyprls
            shfmt
          ];
          ts = with pkgs; [
            typescript-language-server
            prettierd #formatter
            eslint_d #linter
          ];
        };

        # This is for plugins that will load at startup without using packadd:
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            lzextras
            plenary-nvim
            neo-tree-nvim
            nvim-web-devicons
            snacks-nvim
            # vim-sleuth
            (mkPlugin "kanso.nvim" (builtins.fetchGit {
              url = "https://github.com/webhooked/kanso.nvim";
              rev = "748023fd273782e6e056620ce66a176532cdf375";
            }))
          ];
        };

        # not loaded automatically at startup.
        # use with packadd and an autocommand in config to achieve lazy loading
        optionalPlugins = {
          lua = with pkgs.vimPlugins; [
            # lazydev-nvim
          ];

          lint = with pkgs.vimPlugins; [
            nvim-lint
          ];

          format = with pkgs.vimPlugins; [
            conform-nvim
          ];

          cmp = with pkgs.vimPlugins; [
            blink-cmp
            friendly-snippets
            lspkind-nvim
          ];

          lsp = with pkgs.vimPlugins; [
            nvim-lspconfig
          ];

          debug = with pkgs.vimPlugins; [
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
          ];

          extra = {
            telescope = with pkgs.vimPlugins; [
              telescope-fzf-native-nvim
              telescope-nvim
              telescope-ui-select-nvim
              plenary-nvim # dependency
            ];
            ufo = with pkgs.vimPlugins; [
              nvim-ufo
              promise-async # dependency
              statuscol-nvim
            ];

            context = with pkgs.vimPlugins; [
              barbecue-nvim
              nvim-navic # dependency
            ];
            ui = with pkgs.vimPlugins; [
              bufferline-nvim

              # image-nvim
              indent-blankline-nvim

              lualine-nvim
              # lualine-lsp-progress

              neo-tree-nvim
              #dependency
              nui-nvim
              nvim-window-picker
              nvim-web-devicons

              smear-cursor-nvim
            ];
            treesitter = with pkgs.vimPlugins; [
              nvim-treesitter.withAllGrammars
              nvim-treesitter-textobjects
            ];
            life = with pkgs.vimPlugins; [
              comment-nvim
              flash-nvim
              nvim-autopairs

              nvim-surround

              # gitsigns-nvim
            ];
          };
        };

        # shared libraries to be added to LD_LIBRARY_PATH
        # variable available to nvim runtime
        sharedLibraries = {
          general = with pkgs; [];
        };

        # environmentVariables:
        # this section is for environmentVariables that should be available
        # at RUN TIME for plugins. Will be available to path within neovim terminal
        environmentVariables = {
          # test = {
          #   CATTESTVAR = "It worked!";
          # };
        };
      };

      # see :help nixCats.flake.outputs.packageDefinitions
      packageDefinitions.replace = {
        vixmeow = {
          pkgs,
          name,
          ...
        }: {
          settings = {
            configDirName = "vixmeow";
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true; # chane back to true
            aliases = ["vix" "vim"];
          };

          categories = {
            general = true;
            lua = true;
            nix = true;
            hypr = true;
            ts = true;
            lint = true;
            format = true;
            cmp = true;
            lsp = true;
            debug = true;
            extra = true;
          };
          # anything else to pass and grab in lua with `nixCats.extra`
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
    };
  };
}

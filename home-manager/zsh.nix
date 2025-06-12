{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.fzf.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    #envExtra = "export EDITOR=nvim\n export VISUAL=nvim";
    shellAliases = let
      flakePath = "~/system/";
    in {
      # system = "sudo nixos-rebuild switch --flake ${flakePath}";
      # home = "home-manager switch --flake ${flakePath}";
      system = "nh os switch ${flakePath}";
      home = "nh home switch ${flakePath}";

      homecollect = "nix-collect-garbage -d";
      systemcollect = "sudo nix-collect-garbage -d";

      info = "btop";
      ls = "eza --colour=always --icons=always -la";
      fetch = "fastfetch";
      vim = "nvim";
      vide = "neovide";
      slip = "systemctl suspend";
      off = "shutdown now";
      time = "peaclock";
    };
    localVariables = let
      fzfCommand = "fd --strip-cwd-prefix --hidden --follow --exclude .git";
    in {
      KEYTIMEOUT = 1;
      FZF_DEFAULT_COMMAND = fzfCommand;
      FZF_CTRL_T_COMMAND = fzfCommand;
      FZF_CTRL_T_OPTS = "--preview 'if [ -d {} ]; then eza -Ta --icons=always --color=always {}; else bat --color=always --style=numbers {}l fi' \${fzf_custom[@]}";
    };
    initContent = lib.mkMerge [
      (lib.mkBefore ''
               fzf_custom=(
                     --style=full
                     --height=90%
                     --info=inline
                     --border=rounded
                     --bind=ctrl-p:toggle-preview
        #--preview-window=hidden
        #--level= to limit depth of recursion
                     )
      '')

      (lib.mkOrder 1000
        ''
          #source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
              source "$(fzf-share)/key-bindings.zsh"
              source "$(fzf-share)/completion.zsh"
          #zvm_after_init_commands+=(eval "$(fzf --zsh)")
              HISTDUP=erase
              setopt hist_save_no_dups
              setopt hist_find_no_dups
              setopt no_case_glob
              unsetopt beep extended_glob
              setopt beep nomatch notify
              zle_highlight+=('paste:none')
              autoload -Uz compinit; compinit
              zstyle ':completion:*' menu no
          #zstyle ':completion:*' menu select
          #zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
              zstyle ':completion:*' list-colors " ''${(s.:.)LS_COLORS}"
              zstyle ':fzf-tab:*' fzf-flags ''${fzf_custom[@]}
              zstyle ':fzf-tab:*' continuous-trigger 'tab'
                 zstyle ':fzf-tab:complete:*:options' fzf-preview ""
                 zstyle ':fzf-tab:complete:*' fzf-preview '
                 if [[ -d $realpath ]]; then
                    eza -Ta --icons=always --color=always $realpath
                       elif [[ -f $realpath ]]; then
                       bat --color=always --style=numbers $realpath
                       fi'
                       zmodload zsh/complist

          	     bindkey -v
          	     bindkey "^H" backward-delete-char #backspace
          	     bindkey "^?" backward-delete-char #delete

          	     	evil-registers::set-plus(){ typeset -g _evil_register='+' }
          		zle -N set-plus-register evil-registers::set-plus
          		bindkey -M visual ' ' set-plus-register









                       bindkey "^ " autosuggest-accept
                       bindkey "^k" history-search-backward
                       bindkey "^j" history-search-forward
                       bindkey -M menuselect '^[' undo # allow to exit select menu with esc instead of going to normal mode
                       ZSH_AUTOSUGGEST_ACCEPT_WIDGETS[$ZSH_AUTOSUGGEST_ACCEPT_WIDGETS[(i)vi-forward-char]]=()
        '')
    ];
    history = rec {
      path = "$ZDOTDIR/.zhistory";
      extended = true;
      size = 10000000000;
      save = size;
      ignorePatterns = ["ls" "cd" "pwd"];
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
    autocd = true;

    plugins = with pkgs; [
      {
        name = "evil-registers";
        src = fetchFromGitHub {
          owner = "zsh-vi-more";
          repo = "evil-registers";
          rev = "4.0";
          sha256 = "sha256-NtP2Eljohn8V7ISAhFikJVvjq6L6AmizX8YJKej4pwI=";
        };
      }
      {
        name = zsh-autosuggestions.pname;
        src = zsh-autosuggestions.src;
      }
      {
        name = zsh-you-should-use.pname;
        src = zsh-you-should-use.src;
      }
      {
        name = "fzf-tab";
        src = "${zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = zsh-syntax-highlighting.pname;
        src = zsh-syntax-highlighting.src;
      }
    ];
  };
}

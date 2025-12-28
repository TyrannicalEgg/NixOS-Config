{ config, pkgs, lib, ... }: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      extraOptions =
        lib.mkIf config.hardware.nvidia.enabled [ "--unsupported-gpu" ];
      extraPackages = with pkgs; [
        autotiling-rs
        brightnessctl
        fuzzel
        grim
        pamixer
        pavucontrol
        pulseaudio
        slurp
        swayidle
        swaylock
        swaynotificationcenter
        waybar
        wl-clipboard
      ];
    };

    zsh = {
      enable = true;
      enableLsColors = true;
      enableCompletion = true;
      enableBashCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions = {
        enable = true;
        async = true;
      };

      setOptions = [ "CHASE_LINKS" ];

      histSize = 10000;
      histFile = "$HOME/.cache/zsh/.zsh_history";

      shellAliases = {
        la = "ls -A";
        ll = "ls -Alh";
        icat = "kitten icat";
        edit = "sudo -e";
        rebuild = "nh os switch --ask --update";
      };

      ohMyZsh = {
        enable = true;
        theme = "half-life";
        plugins = [
          "aliases"
          "colored-man-pages"
          "command-not-found"
          "compleat"
          "fzf"
          "git"
          "kitty"
          "vi-mode"
          "you-should-use"
          "zoxide"
          "zsh-interactive-cd"
        ];
        customPkgs = [ pkgs.zsh-you-should-use ];
      };
    };
  };
}

{ config, pkgs, ... }: {
  programs = {
    firefox = {
      enable = true;
      policies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url =
              "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };

    light.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        brightnessctl
        grim
        pulseaudio
        slurp
        swayidle
        swaylock
        swaynotificationcenter
        fuzzel
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

      histSize = 10000;
      histFile = "$HOME/.cache/zsh/.zsh_history";

      shellAliases = {
        edit = "sudo -e";
        la = "ls -A";
        ll = "ls -Al";
        rebuild = "nh os switch --ask";
      };

      ohMyZsh = {
        enable = true;
        theme = "half-life";
        plugins = [ "git" ];
        customPkgs = with pkgs; [ zsh-you-should-use ];
      };
    };
  };
}

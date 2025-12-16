{ pkgs, ... }: {
  programs = {
    # firefox = {
    #   enable = true;
    #   policies = {
    #     DisableTelemetry = true;
    #     DisableFirefoxStudies = true;
    #     Preferences = {
    #       "cookiebanners.service.mode.privateBrowsing" =
    #         2; # Block cookie banners in private windows
    #       "cookiebanners.service.mode" = 2; # Block cookie banners
    #       "privacy.donottrackheader.enabled" = true;
    #       "privacy.fingerprintingProtection" = true;
    #       "privacy.resistFingerprinting" = true;
    #       "privacy.trackingprotection.emailtracking.enabled" = true;
    #       "privacy.trackingprotection.enabled" = true;
    #       "privacy.trackingprotection.fingerprinting.enabled" = true;
    #       "privacy.trackingprotection.socialtracking.enabled" = true;
    #     };
    #     ExtensionSettings = {
    #       "uBlock0@raymondhill.net" = {
    #         install_url =
    #           "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    #         installation_mode = "force_installed";
    #       };
    #     };
    #   };
    # };

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
          "lol"
          "vi-mode"
          "you-should-use"
          "zsh-interactive-cd"
        ];
        customPkgs = [ pkgs.zsh-you-should-use ];
      };
    };
  };
}

{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      # CLI
      ani-cli
      ani-skip
      autotiling-rs
      cmus
      fd
      fuzzel
      fzf
      gcc
      git
      grim
      kitty
      mpv
      pamixer
      pavucontrol
      ripgrep
      starship
      stow
      tealdeer
      tree-sitter
      unrar
      unzip
      wget
      yazi
      zathura
      zoxide
      # GUI
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      keepassxc
      librewolf
      signal-desktop
    ];
    shells = [ pkgs.zsh ];
    # loginShellInit = ''
    #   [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    # '';
  };
}

{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      ani-cli
      ani-skip
      cmus
      fd
      fzf
      gcc
      git
      grim
      kitty
      mpv
      ripgrep
      starship
      # stow
      tealdeer
      tree-sitter
      # unrar
      unzip
      wget
      yazi
      zathura
      zoxide
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      keepassxc
      librewolf
      signal-desktop
      zoxide
    ];
    shells = [ pkgs.zsh ];
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway
    '';
  };
}

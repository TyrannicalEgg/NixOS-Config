{ lib, config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      ani-cli
      ani-skip
      fd
      fuzzel
      fzf
      gcc
      git
      heroic
      kitty
      kittysay
      mpv
      nixfmt
      nil
      signal-desktop
      tree-sitter
      unzip
      vesktop
      wget
      wl-clipboard
      zathura
    ];
    shells = [ pkgs.zsh ];
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    '';
  };
}

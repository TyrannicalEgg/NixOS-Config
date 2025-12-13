{ config, pkgs, inputs, ... }: {
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      ani-cli
      ani-skip
      fd
      fuzzel
      fzf
      gcc
      git
      kitty
      kittysay
      mpv
      pavucontrol
      ripgrep
      signal-desktop
      tree-sitter
      unzip
      vesktop
      wget
      zathura
    ];
    shells = [ pkgs.zsh ];
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    '';
  };
}

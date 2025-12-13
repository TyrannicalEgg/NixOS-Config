{ lib, config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [ heroic ];
    shells = [ pkgs.zsh ];
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    '';
  };
}

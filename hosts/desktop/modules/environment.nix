{ lib, config, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      heroic 
      ludusavi
    ];
    shells = [ pkgs.zsh ];
    loginShellInit = ''
      [[ "$(tty)" == /dev/tty1 ]] && sway --unsupported-gpu
    '';
  };
}

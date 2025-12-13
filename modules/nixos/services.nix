{ config, pkgs, ... }: {
  # List services that you want to enable:
  services = {
    gnome.gnome-keyring.enable = true;

    getty = {
      autologinUser = "valentin";
      autologinOnce = true;
    };

    openssh.enable = true;

    pipewire.enable = true;
  };
}

{ lib, config, pkgs, ... }: {
  services = {
    getty = {
      autologinUser = "valentin";
      autologinOnce = true;
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    gnome.gnome-keyring.enable = true;

    xserver.videoDrivers = [ "nvidia" ];
  };
}

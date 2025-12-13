{ lib, config, pkgs, ... }: {
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

    gnome.gnome-keyring.enable = true;

    syncthing = {
      enable = true;
      group = "users";
      user = "valentin";
      dataDir = "/home/valentin/.local/share/syncthing";
      databaseDir = "/home/valentin/.local/state/syncthing";
      configDir = "/home/valentin/.config/syncthing";
    };

    xserver.videoDrivers = [ "nvidia" ];
  };
}

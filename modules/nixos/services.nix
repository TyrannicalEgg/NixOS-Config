{ ... }: {
  # List services that you want to enable:
  services = {
    gnome.gnome-keyring.enable = true;

    openssh.enable = true;

    pipewire.enable = true;
  };
}

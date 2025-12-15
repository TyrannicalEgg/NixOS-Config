{ inputs, ... }: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" "-L" ];
    dates = "6:00";
    allowReboot = true;
  };

  services = {
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire.enable = true;
  };

  time.timeZone = "America/Chicago";
  networking.networkmanager.enable = true;
  users.extraGroups.networkmanager.members = [ "root" ];
}

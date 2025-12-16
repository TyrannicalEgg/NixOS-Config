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

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 2d --keep 5";
    flake = "/etc/nixos";
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    pipewire.enable = true;
  };

  time.timeZone = "America/Chicago";
  networking.networkmanager.enable = true;
  users.extraGroups.networkmanager.members = [ "root" ];
}

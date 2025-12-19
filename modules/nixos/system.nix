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
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 2d --keep 5";
    flake = "/etc/nixos";
  };

  services = {
    gnome.gnome-keyring.enable = true;
    # displayManager.sddm.enable = lib.mkDefault true;
    # desktopManager.plasma6.enable = lib.mkDefault true;
    openssh.enable = true;
    # kde.enable = true;
    pipewire.enable = true;
  };

  time.timeZone = "America/Chicago";
  networking.networkmanager.enable = true;
  users.extraGroups.networkmanager.members = [ "root" ];
}

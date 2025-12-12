# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/environment.nix
    ./modules/programs.nix
    ./modules/services.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking = {
    hostName = "desktop"; # Define your hostname.
    networkmanager.enable = true;
  };

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Set your time zone.
  time = {
    timeZone = "America/Chicago";
    hardwareClockInLocalTime = true;
  };

  nixpkgs.config.allowUnfree = true;

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.valentin = {
      isNormalUser = true;
      description = "Valentin Rodriguez";
      extraGroups = [
        "networkmanager"
        "video"
        "wheel"
      ];
      group = "users";
      shell = pkgs.zsh;
    };
    extraGroups.networkmanager.members = [ "root" ];
    defaultUserShell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.fira-code
    maple-mono.NF
  ];

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [ "electron-36.9.5" ];

  system = {
    # Automatic updates
    autoUpgrade = {
      allowReboot = true;
      enable = true;
      dates = "daily";
    };
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "25.05";
  };
}

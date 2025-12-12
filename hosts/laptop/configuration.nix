# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # <nixos-hardware/asus/zephyrus/ga401>
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/environment.nix
    ./modules/programs.nix
    ./modules/services.nix
    inputs.home-manager.nixosModules.default
  ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable networking
  networking = {
    networkmanager.enable = true;
    hostName = "laptop";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  users = {
    users.valentin = {
      isNormalUser = true;
      description = "Valentin Rodriguez";
      group = "users";
      extraGroups = [ "networkmanager" "video" "wheel" ];
      shell = pkgs.zsh;
      packages = with pkgs; [ ];
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = { AutoEnable = true; };
    };
  };

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      # wheelNeedsPassword = false;
    };
  };

  system = {
    # Automatic updates
    autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [ "--update-input" "nixpkgs" "--commit-lock-file" "-L" ];
      persistent = true;
      operation = "switch";
      dates = "daily";
      allowReboot = true;
    };

    stateVersion = "25.05";
  };
}

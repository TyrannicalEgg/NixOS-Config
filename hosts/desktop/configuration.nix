# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./modules
    ../../modules/nixos
  ];

  networking.hostName = "desktop";

  time.hardwareClockInLocalTime = true;

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
      extraGroups = [ "networkmanager" "video" "wheel" ];
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

  system.stateVersion = "25.05";
}

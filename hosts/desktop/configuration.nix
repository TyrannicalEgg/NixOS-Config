# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
  ];

  bluetooth.enable = false;
  nvidiaDrivers.enable = true;

  environment = { systemPackages = with pkgs; [ heroic ludusavi ]; };

  services = {
    syncthing = {
      enable = true;
      group = "users";
      user = "valentin";
      dataDir = "/home/valentin/.local/share/syncthing";
      databaseDir = "/home/valentin/.local/state/syncthing";
      configDir = "/home/valentin/.config/syncthing";
    };
  };

  networking.hostName = "desktop";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraGroups.networkmanager.members = [ "root" ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

  system.stateVersion = "25.05";
}

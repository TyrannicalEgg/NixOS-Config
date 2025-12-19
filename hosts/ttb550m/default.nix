# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/nixos ./drives.nix ];

  networking.hostName = "ttb550m";

  drivers.bluetooth.enable = true;
  games = {
    syncthing.enable = true;
    heroic.enable = true;
    steam.enable = true;
  };

  system.stateVersion = "25.05";
}

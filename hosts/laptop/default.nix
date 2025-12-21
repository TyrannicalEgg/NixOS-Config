# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  firefox.enable = true;
  drivers.bluetooth.enable = true;
  games = {
    syncthing.enable = true;
    heroic.enable = true;
    steam.enable = true;
  };

  networking.hostName = "laptop";

  system.stateVersion = "25.05";
}

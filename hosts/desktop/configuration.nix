# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
  ];

  networking.hostName = "desktop";

  bluetooth.enable = false;
  nvidiaDrivers.enable = true;
  games.syncthing.enable = true;
  games.heroic.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

  system.stateVersion = "25.05";
}

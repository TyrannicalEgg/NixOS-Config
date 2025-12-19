# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/nixos ];

  networking.hostName = "desktop";

  firefox.enable = true;
  drivers.nvidia.enable = true;
  games = {
    syncthing.enable = true;
    heroic.enable = true;
    steam.enable = true;
  };

  # home-manager = {
  #   extraSpecialArgs = { inherit inputs; };
  #   users."valentin" = import ./home.nix;
  # };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

  system.stateVersion = "25.05";
}

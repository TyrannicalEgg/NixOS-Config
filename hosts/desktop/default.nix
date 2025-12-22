{ ... }:

{
  imports = [ ./hardware-configuration.nix ../../modules/nixos ];

  drivers.nvidia.enable = true;
  games = {
    syncthing.enable = true;
    heroic.enable = true;
    steam.enable = true;
  };

  system.stateVersion = "25.05";
}

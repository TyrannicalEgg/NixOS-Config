# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }: {
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga401
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  bluetooth.enable = true;
  games.heroic.enable = true;
  games.syncthing.enable = true;

  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  # Enable networking
  networking.hostName = "laptop";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

  system.stateVersion = "25.05";
}

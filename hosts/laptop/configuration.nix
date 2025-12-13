# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # <nixos-hardware/asus/zephyrus/ga401>
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
    inputs.home-manager.nixosModules.default
    ../../modules/nixos
  ];

  # Enable networking
  networking.hostName = "laptop";

  users = {
    users.valentin = {
      isNormalUser = true;
      description = "Valentin Rodriguez";
      group = "users";
      extraGroups = [ "networkmanager" "video" "wheel" ];
      shell = pkgs.zsh;
    };
    extraGroups.networkmanager.members = [ "root" ];
    defaultUserShell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."valentin" = import ./home.nix;
  };

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

  system.stateVersion = "25.05";
}

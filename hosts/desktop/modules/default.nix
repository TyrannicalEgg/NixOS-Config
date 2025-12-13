{ config, pkgs, inputs, ... }:
{
  imports = [
    ./environment.nix
    ./programs.nix
    ./services.nix
  ];
}

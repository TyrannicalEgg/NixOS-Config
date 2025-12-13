{ config, pkgs, inputs, ... }:
{
  imports = [
    ./auto-upgrade.nix
  ];
}

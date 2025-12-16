# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, ... }:

{
  boot.initrd.luks.devices."luks-6866b834-8fee-4adc-8093-86449da2f901".device =
    "/dev/disk/by-uuid/6866b834-8fee-4adc-8093-86449da2f901";
  boot.initrd.luks.devices."luks-929c8f5d-65d8-452d-a8e7-bc66694656fd".device =
    "/dev/disk/by-uuid/929c8f5d-65d8-452d-a8e7-bc66694656fd";
  boot.initrd.luks.devices."luks-36b586d7-cc13-4ee8-a19c-38788ec25437".device =
    "/dev/disk/by-uuid/36b586d7-cc13-4ee8-a19c-38788ec25437";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8923-F8EE";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/mnt/Games" = {
    device = "/dev/disk/by-uuid/5e9ec0a8-7d51-4ce5-a5ab-5c307cccfce6";
    fsType = "btrfs";
  };

  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-uuid/b220709b-5f93-478a-864c-f17478b4ce9b";
    fsType = "btrfs";
  };
}

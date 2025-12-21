# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # Device specific automount
  # boot.initrd.luks.devices."luks-36b586d7-cc13-4ee8-a19c-38788ec25437".device = "/dev/disk/by-uuid/36b586d7-cc13-4ee8-a19c-38788ec25437";

  # Networking
  # networking.networkmanager.enable = true;
  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  # time.timeZone = "America/Winnipeg";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_CA.UTF-8";

  # Enable Flakes
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # ZSH default shell users.defaultUserShell = pkgs.zsh; Start Sway on login
  # environment.loginShellInit = ''
  #   [[ "$(tty)" = /dev/tty1 ]] && sway
  # '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

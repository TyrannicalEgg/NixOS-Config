{ config, pkgs, inputs, ... }: {
  imports = [ 
    ./environment.nix 
    ./users.nix
  ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  security.sudo-rs = {
    enable = true;
    execWheelOnly = true;
  };

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.fira-code
    maple-mono.NF
  ];

  time.timeZone = "America/Chicago";

  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [ "--update-input" "nixpkgs" "--commit-lock-file" "-L" ];
    dates = "6:00";
    allowReboot = true;
  };
}

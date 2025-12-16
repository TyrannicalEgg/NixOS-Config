{ config, pkgs, ... }:

{
  imports = [ ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Automatic updates
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    flake = "/etc/nixos/flake.nix";
  };

  # Automatic generation cleanup
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-old";
  };
  nix.settings.auto-optimise-store = true;

  # System packages. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ## CLI
    bat
    bc
    btop
    cmus
    eza
    fd
    fzf
    git
    mpv
    pamixer
    starship
    stow
    tealdeer
    yazi
    zoxide
    unrar
    unzip
    # p7zip
    ## Window Manager
    autotiling-rs
    fuzzel
    grim
    kitty
    mpvpaper
    pavucontrol
    slurp
    swappy
    swaylock-effects
    swaynotificationcenter
    waybar
    waypaper
    wl-clipboard
    wob
    wofi
    ## GUI
    freetube
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    keepassxc
    librewolf
    # orca-slicer
    signal-desktop
    ## Games
    ludusavi
    heroic
    itch
    srb2
    srb2kart
    # sm64coopdx
    ringracers
    vintagestory
  ];

  # Programs
  programs = {
    gamemode.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };
    zsh.enable = true;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
    };
  };

  # Services
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        # variant = "colemak_dh";
      };
    };
    gnome.gnome-keyring.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
    printing.enable = true;
    syncthing = {
      enable = true;
      group = "users";
      user = "vulpes";
      openDefaultPorts = true;
      configDir = "/home/vulpes/.config/syncthing";
    };
    # openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
    };
  };

  security.rtkit.enable = true;

  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.fira-code ];

}

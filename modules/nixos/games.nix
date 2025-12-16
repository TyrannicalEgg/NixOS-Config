{ config, pkgs, lib, ... }: {
  options.games.steam.enable = lib.mkEnableOption "Enable Steam";
  options.games.heroic.enable = lib.mkEnableOption "Enable Heroic";

  config = lib.mkIf cfg.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  config = lib.mkIf config.games.heroic.enable {
    environment.systemPackages = with pkgs; [ heroic ludusavi ];
  };

  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
  };
}

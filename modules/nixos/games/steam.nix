{ config, pkgs, lib, ... }: {
  options.games.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.games.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}

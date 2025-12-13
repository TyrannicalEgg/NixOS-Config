{ config, pkgs, lib, ... }: {
  options.games.heroic.enable = lib.mkEnableOption "Enable Heroic";
  
  config = lib.mkIf config.games.heroic.enable {
    environment.systemPackages = with pkgs; [ heroic ludusavi ];
  };
}

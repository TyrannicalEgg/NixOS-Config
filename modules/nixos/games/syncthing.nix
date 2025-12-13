{ config, lib, ... }: {
  options.games.syncthing.enable = lib.mkEnableOption "Enable Syncthing";

  config = lib.mkIf config.games.syncthing.enable {
    services.syncthing = {
      enable = true;
      group = "users";
      user = "valentin";
      dataDir = "/home/valentin/.local/share/syncthing";
      databaseDir = "/home/valentin/.local/state/syncthing";
      configDir = "/home/valentin/.config/syncthing";
    };
  };
}


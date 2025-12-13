{ config, pkgs, lib, inputs, ... }: {
  users = {
    users = {
      valentin = {
        description = "Valentin Rodriguez";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
      };

      vulpes = {
        description = "Crusacer Entity";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
      };

      ash = {
        description = "Ashypoo Cat";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
      };
    };
    defaultUserShell = pkgs.zsh;
  };
}

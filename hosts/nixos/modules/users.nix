{ pkgs, ... }: {

  users = {
    extraGroups.networkmanager.members = [ "root" ];
    defaultUserShell = pkgs.zsh;

    users = {
      valentin = {
        description = "Valentin Rodriguez";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
        packages = with pkgs;
          [

          ];
      };

      vulpes = {
        description = "Crusacer Entity";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
        packages = with pkgs;
          [

          ];
      };

      ash = {
        description = "Ashypoo Cat";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
        packages = with pkgs;
          [

          ];
      };
    };
  };
}

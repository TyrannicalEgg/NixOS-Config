{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      valentin = {
        description = "Valentin Rodriguez";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
      };

      vulpes = {
        description = "Vampire Entity Vulpes";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        password = "password";
        # packages = with pkgs; [ freetube orca-slicer vintagestory ];
      };

      ash = {
        description = "Ashypoo Cat";
        group = "users";
        extraGroups = [ "networkmanager" "video" "wheel" ];
        isNormalUser = true;
        initialPassword = "password";
      };
    };
  };
}

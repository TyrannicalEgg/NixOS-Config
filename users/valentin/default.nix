{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.valentin = ./home.nix;
    }
  ];
  users.users.valentin = {
    description = "Valentin Rodriguez";
    group = "users";
    extraGroups = [ "networkmanager" "video" "wheel" ];
    isNormalUser = true;
    packages = [ ];
  };
}

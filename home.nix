{ config, pkgs, ... }: {
  home = {
    username = "valentin";
    homeDirectory = "/home/valentin";

    packages = with pkgs; [ ];

    stateVersion = "25.05";
  };
}

{ pkgs, ... }: {
  imports = [
    ../../modules/home-manager
  ];

  home.packages = with pkgs; [
    kittysay
    tree
    btop
    bat
    ripgrep
    jq
    fzf
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      settings.user = {
        name = "TyrannicalEgg";
        email = "valentinrdz0211@gmail.com";
      };
    };
  };

  home.stateVersion = "25.05";
}

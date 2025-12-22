{ pkgs, ... }: {
  home = {
    username = "valentin";
    homeDirectory = "/home/valentin";
    stateVersion = "25.05";

    packages = with pkgs; [
      cowsay
      kittysay
      tree
      btop
      bat
      neofetch
      ripgrep
      jq
      fzf
    ];
  };

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
}

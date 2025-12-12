{ config, pkgs, ... }: {
  home = {
    username = "valentin";
    homeDirectory = "/home/valentin";

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

    stateVersion = "25.05";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "TyrannicalEgg";
      email = "valentinrdz0211@gmail.com";
    };
  };
}

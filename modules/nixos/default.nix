{ pkgs, ... }: {
  imports = [
    ./drivers
    ./games
    ./environment.nix
    ./programs.nix
    ./system.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.fira-code
    maple-mono.NF
  ];
}

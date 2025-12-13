{ config, lib, inputs, ... }:

{
  options.autoUpgrade.enable = lib.mkEnableOption "enable auto upgrades";

  config = lib.mkIf config.autoUpgrade.enable {
    system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
      flags = [ "--update-input" "nixpkgs" "--commit-lock-file" "-L" ];
      dates = "6:00";
      allowReboot = true;
    };
  };
}

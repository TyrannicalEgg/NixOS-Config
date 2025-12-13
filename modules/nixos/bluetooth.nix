{ config, pkgs, lib, inputs, ... }: {
  options.bluetooth.enable = lib.mkEnableOption "support for Bluetooth";

  config = lib.mkIf config.bluetooth.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = { AutoEnable = true; };
      };
    };
  };
}

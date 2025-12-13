{ config, lib, ... }: {
  options = {
    nvidiaDrivers.enable = lib.mkEnableOption "Use Nvidia Proprietary drivers";
  };

  config = lib.mkIf config.nvidiaDrivers.enable {
    hardware = {
      graphics.enable = true;
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = true;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
      };
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}

{ config, lib, ... }: {
  options = {
    drivers.nvidia.enable = lib.mkEnableOption "Use Nvidia Proprietary drivers";
  };

  config = lib.mkIf config.drivers.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
      graphics.enable = true;
      nvidia = {
        modesetting.enable = true;
        open = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
      };
    };

    programs.sway.extraOptions =
      lib.mkIf (config.drivers.nvidia.enable && config.programs.sway.enable)
      [ "--unsupported-gpu" ];
  };
}

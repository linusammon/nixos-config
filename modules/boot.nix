{
  flake.modules.nixos.common = {
    boot = {
      initrd = {
        systemd.enable = true;
        availableKernelModules = [ "uas" ];
      };

      loader = {
        systemd-boot = {
          enable = true;
          memtest86.enable = true;
          configurationLimit = 20;
        };

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };
  };
}

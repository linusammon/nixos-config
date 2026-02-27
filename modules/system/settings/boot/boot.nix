{
  flake.modules.nixos.boot = {
    boot.loader.systemd-boot = {
      enable = true;
      memtest86.enable = true;
      configurationLimit = 20;
    };

    boot.loader.efi.canTouchEfiVariables = true;
  };
}

{
  flake.modules.nixos.boot = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 50;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}

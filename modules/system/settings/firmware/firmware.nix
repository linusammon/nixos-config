{
  flake.modules.nixos.firmware = {
    services.fwupd.enable = true;
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
  };
}

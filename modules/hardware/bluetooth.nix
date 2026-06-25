{
  modules.nixos.hardware.bluetooth = _: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}

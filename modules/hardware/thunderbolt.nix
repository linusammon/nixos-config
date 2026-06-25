{
  modules.nixos.hardware.thunderbolt = _: {
    boot.initrd.availableKernelModules = [ "thunderbolt" ];
  };
}

{
  modules.nixos.hardware.disk.vmd = _: {
    boot.initrd.availableKernelModules = [ "vmd" ];
  };
}

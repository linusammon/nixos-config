{
  modules.nixos.hardware.disk.sata = _: {
    boot.initrd.availableKernelModules = [ "sd_mod" ];
  };
}

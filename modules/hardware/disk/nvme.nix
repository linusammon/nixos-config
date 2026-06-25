{
  modules.nixos.hardware.disk.nvme = _: {
    boot.initrd.availableKernelModules = [ "nvme" ];
  };
}

{
  modules.nixos.hardware.virtio = _: {
    boot.initrd.kernelModules = [
      "virtio_blk"
      "virtio_pci"
      "virtio_net"
      "virtio_scsi"
    ];
  };
}

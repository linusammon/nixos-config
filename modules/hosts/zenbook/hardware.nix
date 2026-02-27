{ self, ... }:
{
  flake.modules.nixos.zenbook = {
    imports = with self.modules.nixos; [
      cpu-intel
      gpu-amd
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "vmd"
      "nvme"
      "usb_storage"
      "sd_mod"
    ];
  };
}

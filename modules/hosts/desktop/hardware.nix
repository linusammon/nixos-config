{ self, ... }:
{
  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      cpu-intel
      gpu-amd
    ];

    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
  };
}

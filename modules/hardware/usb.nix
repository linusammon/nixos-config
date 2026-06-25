{
  modules.nixos.hardware.usb = _: {
    boot.initrd.availableKernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];
  };
}

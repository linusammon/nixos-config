{
  flake.modules.nixos.desktop =
    {
      config,
      lib,
      ...
    }:
    {
      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      boot.kernelModules = [ "kvm-intel" ];

      services.xserver.videoDrivers = [ "amdgpu" ];
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}

{
  flake.modules.nixos.zenbook =
    {
      config,
      lib,
      ...
    }:
    {
      boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" ];
      boot.kernelModules = [ "kvm-intel" ];

      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;    
    };
}

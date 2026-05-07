{
  flake.modules.nixos.host_zenbook =
    { config, lib, ... }:
    let
      inherit (config.custom.constants) system;
    in
    {
      boot = {
        initrd.availableKernelModules = [
          "xhci_pci"
          "thunderbolt"
          "vmd"
          "nvme"
          "usb_storage"
          "sd_mod"
        ];
        initrd.kernelModules = [ ];
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];
      };

      nixpkgs.hostPlatform = lib.mkDefault system;

      hardware.enableAllFirmware = true;
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableAllFirmware;
    };
}

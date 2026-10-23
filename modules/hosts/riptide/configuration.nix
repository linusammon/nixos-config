{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "riptide" {
    modules =
      with self.modules.nixos;
      with self.lib;
      [
        (collect gui { })
        (collect cli { })
        (collect system { })

        hardware.usb
        hardware.disk.nvme
        hardware.disk.sata
        hardware.cpu.intel
        hardware.gpu.amd
        hardware.firmware
        hardware.networking
        hardware.zsa

        ./_disko.nix
      ];
  };
}

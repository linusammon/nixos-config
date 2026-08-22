{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "zenbook" {
    modules =
      with self.modules.nixos;
      with self.lib;
      [
        (collect gui {
          exclude = [
            "steam"
            "minecraft"
          ];
        })
        (collect cli { })
        (collect system { })

        hardware.usb
        hardware.thunderbolt
        hardware.disk.nvme
        hardware.disk.vmd
        hardware.cpu.intel
        hardware.gpu.intel
        hardware.firmware
        hardware.networking
        hardware.bluetooth
        hardware.power
        hardware.zsa

        ./_disko.nix
      ];
  };
}

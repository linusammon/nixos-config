{ self, ... }:
{
  nixosConfigurations = self.lib.mkNixos "zenbook" {
    modules =
      with self.modules.nixos;
      with self.lib;
      [
        (collect gui { exclude = [ "games" ]; })
        (collect cli { })
        (collect system { })

        secrets

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

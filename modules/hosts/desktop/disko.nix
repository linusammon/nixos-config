{ self, ... }:
{
  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      disko
    ];

    disko.devices.disk.main.device = "/dev/nvme0n1";
  };
}

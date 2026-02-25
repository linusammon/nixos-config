{ self, ... }:
{
  flake.modules.nixos.desktop = {
    imports = [
      (self.factory.disko {
        device = "/dev/nvme0n1";
        hostId = "deadbeef";
        swap = "96G";
      })
    ];
  };
}

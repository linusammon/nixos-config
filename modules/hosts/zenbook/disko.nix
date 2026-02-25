{ self, ... }:
{
  flake.modules.nixos.zenbook = {
    imports = [
      (self.factory.disko {
        device = "/dev/nvme0n1";
        hostId = "deadbeef";
        swap = "32G";
      })
    ];
  };
}

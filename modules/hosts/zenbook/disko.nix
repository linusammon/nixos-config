{ self, ... }:
{
  flake.modules.nixos.zenbook = {
    imports = [
      (self.factory.disko {
        device = "/dev/nvme0n1";
        hostId = "6e11a3f0";
        swap = "32G";
      })
    ];
  };
}

{ self, ... }:
{
  flake.modules.nixos.zenbook = {
    imports = [
      (self.factory.disko {
        device = "/dev/nvme0n1";
        swap = "32G";
      })
    ];
  };
}

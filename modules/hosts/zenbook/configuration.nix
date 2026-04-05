{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    name = "zenbook";
    system = "x86_64-linux";
    timeZone = "Europa/Zurich";
  };

  flake.modules.nixos.zenbook = {
    imports = with self.modules.nixos; [
      (self.lib.mkDisko {
        device = "/dev/nvme0n1";
        swap = "32G";
      })
      system-portable
    ];
  };
}

{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    name = "desktop";
    system = "x86_64-linux";
    timeZone = "Europe/Zurich";
  };

  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      (self.lib.mkDisko {
        device = "/dev/nvme0n1";
        swap = "96G";
      })
      system-graphical
    ];
  };
}

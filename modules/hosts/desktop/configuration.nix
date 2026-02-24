{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    name = "desktop";
    system = "x86_64-linux";
    timeZone = "Europe/Zurich";
  };

  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      system-graphical
    ];
  };
}

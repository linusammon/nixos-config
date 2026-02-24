{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    hostName = "desktop";
    system = "x86_64-linux";
  };

  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      system-desktop
      docker
      gaming
    ];
  };
}

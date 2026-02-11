{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    hostName = "zenbook";
    system = "x86_64-linux";
  };

  flake.modules.nixos.zenbook = {
    imports = with self.modules.nixos; [
      system-desktop
      networking
      bluetooth
      upower
      tuned
      docker
    ];
  };
}

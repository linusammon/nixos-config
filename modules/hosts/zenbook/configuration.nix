{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    hostName = "zenbook";
    system = "x86_64-linux";
    timeZone = "Europa/Zurich";
  };

  flake.modules.nixos.zenbook = {
    imports = with self.modules.nixos; [
      system-portable
    ];
  };
}

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
    ];

    programs.steam.enable = true; # Needs to be enabled system wide; TODO: Refactor this into a separate module
  };
}

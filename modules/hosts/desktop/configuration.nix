{ self, ... }:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    hostName = "desktop";
    system = "x86_64-linux";
  };

  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; [
      system-default
      boot
      firmware
      local
      sddm
      niri
    ];

    programs.steam.enable = true;
  };
}

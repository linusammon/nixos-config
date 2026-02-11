{ self, ... }:
{
  flake.modules.nixos.system-desktop = {
    imports = with self.modules.nixos; [
      system-default

      sddm
      niri
    ];
  };
}

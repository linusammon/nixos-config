{ self, ... }:
{
  flake.modules.nixos.system-graphical = {
    imports = with self.modules.nixos; [
      system-default
      
      sddm
      niri
    ];
  };
}
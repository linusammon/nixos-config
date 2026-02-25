{ self, ... }:
{
  flake.modules.nixos.system-portable = {
    imports = with self.modules.nixos; [
      system-graphical

      networking
      bluetooth
      upower
      tuned
    ];
  };
}

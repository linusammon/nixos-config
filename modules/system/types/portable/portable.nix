{ self, ... }:
{
  flake.modules.nixos.system-portable = {
    imports = with self.modules.nixos; [
      system-graphical

      bluetooth
      upower
      tuned
    ];
  };
}

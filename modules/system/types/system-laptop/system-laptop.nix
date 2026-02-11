{ self, ... }:
{
  flake.modules.nixos.system-laptop = {
    imports = with self.modules.nixos; [
      system-desktop

      networking
      bluetooth
      upower
      tuned
    ];
  };
}

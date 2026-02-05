{ self, ... }:
{
  flake.modules.nixos.desktop = {
    imports = with self.modules.nixos; with self.factory; [ linus ];
  };
}

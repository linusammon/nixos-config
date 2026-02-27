{ self, ... }:
{
  flake.modules.nixos.zenbook = {
    imports = with self.modules.nixos; [ root ];
  };
}

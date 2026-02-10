{ self, ... }:
{
  flake.modules.nixos.system-default = {
    imports = with self.modules.nixos; [
      system-minimal

      home-manager

      boot
      firmware
      local
    ];
  };

  flake.modules.homeManager.system-default = {
    imports = with self.modules.homeManager; [
      system-minimal

      git
      treefmt
      nh
    ];
  };
}

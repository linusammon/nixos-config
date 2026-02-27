{ self, ... }:
{
  flake.modules.nixos.system-default = {
    imports = with self.modules.nixos; [
      system-minimal

      firmware
    ];

    home-manager.sharedModules = [
      self.modules.homeManager.system-default
    ];
  };

  flake.modules.homeManager.system-default = {
    imports = with self.modules.homeManager; [
      git
      helix
      yazi
      nh
    ];
  };
}

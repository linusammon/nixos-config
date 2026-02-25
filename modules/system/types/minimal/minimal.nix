{ self, ... }:
{
  flake.modules.nixos.system-minimal = {
    imports = with self.modules.nixos; [
      nixos
      home-manager
      impermanence
    ];

    system.stateVersion = "26.05";

    home-manager.sharedModules = [
      self.modules.homeManager.system-minimal
    ];
  };

  flake.modules.homeManager.system-minimal = {
    home.stateVersion = "26.05";
  };
}

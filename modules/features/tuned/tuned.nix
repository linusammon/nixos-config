{ self, ... }:
{
  flake.modules.nixos.tuned = {
    services.tuned.enable = true;

    home-manager.sharedModules = [
      self.modules.homeManager.tuned
    ];
  };

  flake.modules.homeManager.tuned = {
    xdg.desktopEntries = {
      "tuned-gui" = {
        name = "tuned-gui";
        noDisplay = true;
      };
    };
  };
}

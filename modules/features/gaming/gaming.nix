{ self, ... }:
{
  flake.modules.nixos.gaming = {
    programs = {
      steam.enable = true;
      gamescope.enable = true;
    };

    home-manager.sharedModules = [
      self.modules.homeManager.gaming
    ];
  };

  flake.modules.homeManager.gaming = {
    home.persistence."/persistent".directories = [
      ".local/share/Steam"
    ];
  };
}

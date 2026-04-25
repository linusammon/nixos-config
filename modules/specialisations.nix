{
  flake.modules.nixos.specialisations_steam = {
    specialisation.steam.configuration = {
      programs = {
        steam.enable = true;
        gamemode.enable = true;
      };
    };

    custom.persist.user.directories = [
      ".local/share/Steam"
    ];
  };
}

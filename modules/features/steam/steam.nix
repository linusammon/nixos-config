{
  flake.modules.nixos.steam = {
    specialisation.steam.configuration = {
      programs = {
        steam.enable = true;
        gamemode.enable = true;
      };
    };

    persistence.user.directories = [
      ".local/share/Steam"
    ];
  };
}

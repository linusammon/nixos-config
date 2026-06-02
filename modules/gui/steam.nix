{
  flake.modules.nixos.programs_steam = {
    programs.steam.enable = true;

    custom.persist.user.directories = [
      ".local/share/Steam"
    ];
  };
}

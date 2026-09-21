{
  modules.nixos.gui.games.steam = _: {
    programs.steam.enable = true;

    custom.persist.user.directories = [
      ".local/share/Steam"
    ];
  };
}

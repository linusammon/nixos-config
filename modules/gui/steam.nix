{
  modules.nixos.gui.steam = _: {
    programs.steam.enable = true;

    custom.persist.user.directories = [
      ".local/share/Steam"
    ];
  };
}

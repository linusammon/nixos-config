{
  modules.nixos.gui.games.heroic = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.heroic
    ];

    custom.persist.user.directories = [
      "Games"
    ];
  };
}

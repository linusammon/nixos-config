{
  modules.nixos.gui.heroic = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.heroic
    ];

    custom.persist.user.directories = [
      "Games"
    ];
  };
}

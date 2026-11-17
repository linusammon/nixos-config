{
  modules.nixos.gui.games.lutris = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.lutris ];

    custom.persist.user.directories = [
      ".config/lutris"
      "Games"
    ];
  };
}

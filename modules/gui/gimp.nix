{
  modules.nixos.gui.gimp = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.gimp
    ];

    custom.persist.user.directories = [
      ".config/GIMP"
    ];
  };
}

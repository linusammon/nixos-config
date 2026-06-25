{
  modules.nixos.gui.nautilus = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.nautilus ];

    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}

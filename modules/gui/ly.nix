{
  modules.nixos.gui.ly = { user, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        inherit user;
      };
      ly = {
        enable = true;
        x11Support = false;
      };
    };
  };
}

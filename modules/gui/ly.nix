{
  modules.nixos.gui.ly = { args, ... }: {
    services.displayManager = {
      autoLogin = {
        enable = true;
        inherit (args) user;
      };
      ly = {
        enable = true;
        x11Support = false;
      };
    };
  };
}

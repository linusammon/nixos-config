{
  flake.modules.nixos.sddm = {
    services.displayManager = {
      autoLogin = {
        enable = true;
        user = "linus";
      };

      ly = {
        enable = true;
        x11Support = false;
      };
    };
  };
}

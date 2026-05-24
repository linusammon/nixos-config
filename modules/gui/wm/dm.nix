{
  flake.modules.nixos.wm =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
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

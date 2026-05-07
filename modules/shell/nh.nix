{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      programs.nh = {
        enable = true;
        flake = "/home/${user}/Projects/nixos-config";
        clean = {
          enable = true;
          dates = "daily";
          extraArgs = "--keep-since 7d --optimise";
        };
      };
    };
}

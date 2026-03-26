{
  flake.modules.homeManager.nh =
    { config, ... }:
    {
      programs.nh = {
        enable = true;
        flake = "${config.home.homeDirectory}/projects/nixos-config";
        clean = {
          enable = true;
          extraArgs = "--keep-since 3d --keep 3";
        };
      };
    };
}

{
  modules.nixos.cli.nh = { user, ... }: {
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

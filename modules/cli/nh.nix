{
  modules.nixos.cli.nh = { args, ... }: {
    programs.nh = {
      enable = true;
      flake = "/home/${args.user}/Projects/nixos-config";
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep-since 7d --optimise";
      };
    };
  };
}

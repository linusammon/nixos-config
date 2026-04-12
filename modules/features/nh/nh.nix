{
  flake.modules.nixos.nh = {
    programs.nh = {
      enable = true;
      flake = "/home/linus/projects/nixos-config"; # TODO: don't hardcode this
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 5 --optimise";
      };
    };
  };
}

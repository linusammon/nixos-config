{
  flake.modules.homeManager.nh = {
    programs.nh = {
      enable = true;

      clean = {
        enable = true;
        extraArgs = "--keep-since 3d --keep 3";
      };
    };
  };
}

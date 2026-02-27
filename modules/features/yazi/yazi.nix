{
  flake.modules.homeManager.yazi = {
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        mgr = {
          ratio = [
            0
            4
            4
          ];
          show_hidden = true;
          show_symlink = true;
          sort = "natural";
        };

        theme = {
          indicator = {
            padding = {
              open = "█";
              close = "█";
            };
          };
        };
      };
    };
  };
}

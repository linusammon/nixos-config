{
  flake.modules.homeManager.cava = {
    programs.cava = {
      enable = true;
      settings = {
        general.bar_width = 3;
      };
    };
  };
}

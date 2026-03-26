{
  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      settings = {
        line_break.disabled = true;
      };
    };
  };
}

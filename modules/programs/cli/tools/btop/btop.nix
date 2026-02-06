{
  flake.modules.homeManager.btop = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "noctalia";
        theme_background = false;
        rounded_corners = false;
        update_ms = 1000;
      };
    };
  };
}

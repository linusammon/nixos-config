{
  flake.modules.homeManager.btop = {
    programs.btop = {
      enable = true;
      settings = {
        theme_background = false;
        rounded_corners = false;
        update_ms = 1000;
      };
    };

    xdg.desktopEntries = {
      "btop" = {
        name = "btop++";
        noDisplay = true;
      };
    };
  };
}

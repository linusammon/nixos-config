{ inputs, ... }:
{
  flake.modules.homeManager.stylix = {
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;

      image = ./../../../wallpapers/001.png;

      colorGeneration = {
        polarity = "dark";
        scheme = "content"; # "content", "expressive", "fidelity", "fruit-salad", "monochrome", "neutral", "rainbow", "tonal-spot", "vibrant"
      };

      opacity =
        let
          opacity = 0.9;
        in
        {
          applications = opacity;
          desktop = opacity;
          terminal = opacity;
          popups = opacity;
        };

      targets.firefox.profileNames = [ "default" ];
    };

    xdg.desktopEntries = {
      "kvantummanager" = {
        name = "Kvantum Manager";
        noDisplay = true;
      };
      "qt5ct" = {
        name = "Qt5 Settings";
        noDisplay = true;
      };
      "qt6ct" = {
        name = "Qt6 Settings";
        noDisplay = true;
      };
    };
  };
}

{ inputs, ... }:
{
  flake.modules.homeManager.stylix = {
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;

      image = "${inputs.wallpapers}/001.png";

      colorGeneration = {
        polarity = "dark";
        lightness.dark = 0.02;
        scheme = "content"; # "content", "expressive", "fidelity", "fruit-salad", "monochrome", "neutral", "rainbow", "tonal-spot", "vibrant"
      };

      opacity.desktop = 0.97;

      targets.firefox.profileNames = [ "default" ];
    };

    home.persistence."/persist".directories = [
      ".config/gtk-3.0"
      ".config/gtk-4.0"
      ".config/qt5ct"
      ".config/qt6ct"
    ];

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
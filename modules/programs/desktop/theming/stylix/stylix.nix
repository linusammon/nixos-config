{ inputs, ... }:
{
  flake.modules.homeManager.stylix = {
    imports = [ inputs.stylix.homeModules.stylix ];

    stylix = {
      enable = true;

      image = "${inputs.wallpapers}/003.png";

      colorGeneration = {
        polarity = "dark";
        lightness.dark = 0.02;
        scheme = "content"; # "content", "expressive", "fidelity", "fruit-salad", "monochrome", "neutral", "rainbow", "tonal-spot", "vibrant"
      };

      opacity.desktop = 0.97;

      targets.firefox.profileNames = [ "default" ];
    };
  };
}

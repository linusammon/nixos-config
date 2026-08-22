{ self, ... }:
{
  modules.nixos.gui.qt = _: {
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = "kvantum";
    };

    custom.symlinks.files = {
      "Kvantum/Base16Kvantum/Base16Kvantum.kvconfig" = import ./_theme-config.nix {
        inherit (self.theme) colors;
      };
      "Kvantum/Base16Kvantum/Base16Kvantum.svg" = import ./_theme-svg.nix {
        inherit (self.theme) colors;
      };
      "Kvantum/kvantum.kvconfig" = import ./_config.nix;
    };
  };
}

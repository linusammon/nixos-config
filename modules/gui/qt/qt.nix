{
  modules.nixos.gui.qt = { theme, ... }: {
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = "kvantum";
    };

    custom.symlinks.files = {
      "Kvantum/Base16Kvantum/Base16Kvantum.kvconfig" = import ./_theme-config.nix theme;
      "Kvantum/Base16Kvantum/Base16Kvantum.svg" = import ./_theme-svg.nix theme;
      "Kvantum/kvantum.kvconfig" = import ./_config.nix;
    };
  };
}

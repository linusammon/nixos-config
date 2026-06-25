{
  modules.nixos.gui.qt = { theme, ... }: {
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = "kvantum";
    };

    hj.xdg.config.files = {
      "Kvantum/Base16Kvantum/Base16Kvantum.kvconfig".text = import ./_theme-config.nix theme;
      "Kvantum/Base16Kvantum/Base16Kvantum.svg".text = import ./_theme-svg.nix theme;
      "Kvantum/kvantum.kvconfig".text = import ./_config.nix;
    };
  };
}

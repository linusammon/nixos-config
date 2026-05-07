{ self, ... }:
{
  flake.modules.nixos.wm = {
    qt = {
      enable = true;
      platformTheme = "qt5ct";
      style = "kvantum";
    };

    hj.xdg.config.files = {
      "Kvantum/Base16Kvantum/Base16Kvantum.kvconfig".text = import ./_theme-config.nix { inherit self; };
      "Kvantum/Base16Kvantum/Base16Kvantum.svg".text = import ./_theme-svg.nix { inherit self; };
      "Kvantum/kvantum.kvconfig".text = import ./_config.nix;
    };

    nixpkgs.overlays = [
      (_final: prev: {
        libsForQt5 = prev.libsForQt5.overrideScope (
          _qt5final: qt5prev: {
            qt5ct = self.lib.stripDesktopFiles qt5prev.qt5ct;
          }
        );
        qt6Packages = prev.qt6Packages.overrideScope (
          _qt6final: qt6prev: {
            qt6ct = self.lib.stripDesktopFiles qt6prev.qt6ct;
          }
        );
        kvantum = self.lib.stripDesktopFiles prev.kvantum;
      })
    ];
  };
}

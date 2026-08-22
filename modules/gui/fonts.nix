{ self, ... }:
{
  modules.nixos.gui.fonts = { pkgs, ... }: {
    fonts = with self.theme.fonts; {
      fontconfig.defaultFonts = {
        sansSerif = [ sans ];
        serif = [ serif ];
        monospace = [ mono ];
      };

      packages = packages pkgs;
    };
  };
}

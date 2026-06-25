{
  modules.nixos.gui.fonts = { pkgs, theme, ... }: {
    fonts = with theme.fonts; {
      fontconfig.defaultFonts = {
        sansSerif = [ sans ];
        serif = [ serif ];
        monospace = [ mono ];
      };

      packages = packages pkgs;
    };
  };
}

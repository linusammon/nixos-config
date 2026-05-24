{ self, ... }:
{
  flake.modules.nixos.wm =
    { pkgs, ... }:
    with self.fonts;
    {
      fonts = {
        fontconfig.defaultFonts = {
          sansSerif = [ sans ];
          serif = [ serif ];
          monospace = [ mono ];
        };

        packages = packages pkgs;
      };
    };
}

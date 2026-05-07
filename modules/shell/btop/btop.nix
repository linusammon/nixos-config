{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.btop = inputs.wrappers.wrappers.btop.wrap {
        inherit pkgs;
        package = self.lib.stripDesktopFiles pkgs.btop;
        themes = import ./_themes.nix { inherit self; };
        settings = {
          color_theme = "base16";
          theme_background = false;
          rounded_corners = false;
          cpu_single_graph = true;
          clock_format = "";
        };
      };
    };

  flake.modules.nixos.common =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.btop
      ];
    };
}

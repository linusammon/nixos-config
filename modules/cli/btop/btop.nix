{ self, inputs, ... }:
{
  packages = self.lib.perSystem (pkgs: {
    btop = inputs.nix-wrapper-modules.wrappers.btop.wrap {
      inherit pkgs;
      themes = import ./_themes.nix { inherit (self.theme) colors; };
      settings = {
        color_theme = "base16";
        theme_background = false;
        rounded_corners = false;
        cpu_single_graph = true;
        clock_format = "";
      };
    };
  });

  modules.nixos.cli.btop = { pkgs, ... }: {
    environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.btop ];
  };
}

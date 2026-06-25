{ inputs, config, ... }: {
  packages.btop =
    pkgs:
    inputs.nix-wrapper-modules.wrappers.btop.wrap {
      inherit pkgs;
      package = pkgs.btop;
      themes = import ./_themes.nix config;
      settings = {
        color_theme = "base16";
        theme_background = false;
        rounded_corners = false;
        cpu_single_graph = true;
        clock_format = "";
      };
    };

  modules.nixos.cli.btop = { pkgs, ... }: {
    environment.systemPackages = [ (config.packages.btop pkgs) ];
  };
}

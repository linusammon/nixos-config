{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.niri = inputs.wrappers.wrappers.niri.wrap {
        inherit pkgs;
        package = pkgs.niri;
        settings = import ./_settings.nix;
        v2-settings = true;
      };
    };

  flake.modules.nixos.wm_niri =
    {
      pkgs,
      config,
      ...
    }:
    let
      niri' = self.packages.${pkgs.stdenv.hostPlatform.system}.niri.wrap {
        settings = {
          spawn-sh-at-startup = config.custom.autostart;
          binds = config.custom.keybinds;
          cursor = with self.cursor; {
            xcursor-theme = theme;
            xcursor-size = size;
          };
        };
        extraSettings = [
          {
            include = [
              { optional = true; }
              "~/.config/niri/monitors.kdl"
            ];
          }
        ];
      };
    in
    {
      imports = [ self.modules.nixos.wm ];

      programs.niri = {
        enable = true;
        package = niri';
      };

      environment.systemPackages = [
        pkgs.xwayland-satellite
        (self.cursor.package pkgs)
      ];

      custom.persist.user.files = [
        ".config/niri/monitors.kdl"
      ];
    };
}

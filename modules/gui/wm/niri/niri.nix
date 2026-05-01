{
  self,
  inputs,
  ...
}:
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
    { pkgs, config, ... }:
    {
      imports = [ self.modules.nixos.wm ];

      programs.niri = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.niri.wrap {
          settings = {
            spawn-sh-at-startup = config.custom.autostart;
            binds = config.custom.keybinds;
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
      };

      environment.systemPackages = with pkgs; [
        xwayland-satellite
        bibata-cursors
      ];

      custom.persist.user.files = [
        ".config/niri/monitors.kdl"
      ];
    };
}

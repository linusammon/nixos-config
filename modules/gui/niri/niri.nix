{ self, inputs, ... }:
let
  niriPkg =
    pkgs:
    inputs.nix-wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      package = pkgs.niri;
      settings = import ./_settings.nix { inherit (self.theme) colors; };
    };
in
{
  packages = self.lib.perSystem (pkgs: {
    niri = niriPkg pkgs;
  });

  modules.nixos.gui.niri =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      options.custom.keybinds = lib.mkOption {
        type = lib.types.attrsOf lib.types.anything;
        default = { };
      };

      config =
        let
          niri = (niriPkg pkgs).wrap {
            settings = {
              binds = config.custom.keybinds;
              cursor = with self.theme.cursor; {
                xcursor-theme = name;
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
          programs.niri = {
            enable = true;
            package = niri;
          };

          environment.systemPackages = [
            pkgs.xwayland-satellite
            (self.theme.cursor.package pkgs)
          ];

          services.gnome.gcr-ssh-agent.enable = false;

          custom.persist.user = {
            directories = [
              ".local/share/keyrings"
            ];
            files = [
              ".config/niri/monitors.kdl"
            ];
          };
        };
    };
}

{ inputs, config, ... }:
let
  niriPkg =
    pkgs:
    inputs.nix-wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      package = pkgs.niri;
      settings = import ./_settings.nix config;
    };
in
{
  packages.niri = niriPkg;

  modules.nixos.gui.niri =
    {
      pkgs,
      config,
      lib,
      theme,
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
              cursor = with theme.cursor; {
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
            (theme.cursor.package pkgs)
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

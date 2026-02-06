{ inputs, self, ... }:
{
  flake.modules.nixos.niri = {
    programs.niri.enable = true;

    home-manager.sharedModules = [ self.modules.homeManager.niri ];
  };

  flake.modules.homeManager.niri =
    { pkgs, ... }:
    {
      imports = [ inputs.niri.homeModules.niri ];

      home.packages = with pkgs; [
        bibata-cursors
        xwayland-satellite
      ];

      programs.niri = {
        enable = true;
        package = pkgs.niri;
        settings = {
          cursor = {
            theme = "Bibata-Modern-Ice";
            size = 22;
          };

          input = {
            keyboard.xkb.layout = "de";
            focus-follows-mouse.enable = true;
          };

          outputs = {
            "DP-1" = {
              mode = {
                width = 1920;
                height = 1080;
              };
              position = {
                x = 1920;
                y = 0;
              };
            };
            "DP-2" = {
              mode = {
                width = 1920;
                height = 1080;
              };
              position = {
                x = 0;
                y = 0;
              };
            };
            "HDMI-A-1" = {
              mode = {
                width = 1920;
                height = 1080;
              };
              position = {
                x = 3840;
                y = 0;
              };
            };
          };

          prefer-no-csd = true;

          layout = {
            focus-ring.enable = false;
            tab-indicator.enable = false;

            background-color = "transparent";

            default-column-width = {
              proportion = 1. / 2.;
            };

            preset-column-widths = [
              { proportion = 1. / 3.; }
              { proportion = 1. / 2.; }
              { proportion = 2. / 3.; }
              { proportion = 1. / 1.; }
            ];
          };

          layer-rules = [
            {
              place-within-backdrop = true;
            }
          ];

          window-rules = [
            {
              clip-to-geometry = true;
              open-fullscreen = false;
              opacity = 0.97;
            }
          ];

          hotkey-overlay.skip-at-startup = true;

          binds = {
            "Mod+Space".action.spawn-sh = "noctalia-shell ipc call launcher toggle";
            "Mod+B".action.spawn-sh = "noctalia-shell ipc call wallpaper toggle";

            "Mod+Return".action.spawn = "kitty";
            "Mod+Shift+B".action.spawn = "firefox";

            "Mod+Q".action.close-window = [ ];
            "Mod+O".action.toggle-overview = [ ];
            "Mod+F".action.maximize-column = [ ];
            "Mod+Shift+F".action.fullscreen-window = [ ];
            "Mod+R".action.switch-preset-column-width = [ ];

            "Mod+Up".action.focus-window-up = [ ];
            "Mod+Down".action.focus-window-down = [ ];
            "Mod+Right".action.focus-column-right = [ ];
            "Mod+Left".action.focus-column-left = [ ];

            "Mod+Shift+Up".action.move-window-up = [ ];
            "Mod+Shift+Down".action.move-window-down = [ ];
            "Mod+Shift+Right".action.move-column-right = [ ];
            "Mod+Shift+Left".action.move-column-left = [ ];

            "Mod+WheelScrollUp".action.focus-column-left = [ ];
            "Mod+WheelScrollDown".action.focus-column-right = [ ];

            "Mod+Shift+WheelScrollUp".action.move-column-left = [ ];
            "Mod+Shift+WheelScrollDown".action.move-column-right = [ ];

            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;
            "Mod+0".action.focus-workspace = 10;

            "Mod+Shift+1".action.move-column-to-workspace = 1;
            "Mod+Shift+2".action.move-column-to-workspace = 2;
            "Mod+Shift+3".action.move-column-to-workspace = 3;
            "Mod+Shift+4".action.move-column-to-workspace = 4;
            "Mod+Shift+5".action.move-column-to-workspace = 5;
            "Mod+Shift+6".action.move-column-to-workspace = 6;
            "Mod+Shift+7".action.move-column-to-workspace = 7;
            "Mod+Shift+8".action.move-column-to-workspace = 8;
            "Mod+Shift+9".action.move-column-to-workspace = 9;
            "Mod+Shift+0".action.move-column-to-workspace = 10;
          };

          xwayland-satellite.enable = true;
        };
      };
    };
}

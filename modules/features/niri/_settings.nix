{
  input = {
    keyboard = {
      xkb = {
        layout = "de";
        model = "";
        rules = "";
        variant = "";
      };
      repeat-delay = 600;
      repeat-rate = 25;
      track-layout = "global";
    };
    touchpad = {
      tap = _: { };
      natural-scroll = _: { };
    };
    mouse = {
      accel-speed = 0;
      accel-profile = "flat";
    };
    focus-follows-mouse = _: { };
  };

  outputs = {
    "DP-2" = {
      transform = "normal";
      position = _: {
        props = {
          x = 0;
          y = 0;
        };
      };
      mode = "1920x1080";
    };
    "DP-1" = {
      transform = "normal";
      position = _: {
        props = {
          x = 1920;
          y = 0;
        };
      };
      mode = "1920x1080";
    };
    "HDMI-A-1" = {
      transform = "normal";
      position = _: {
        props = {
          x = 3840;
          y = 0;
        };
      };
      mode = "1920x1080";
    };
  };

  binds = {
    "Mod+Escape".spawn-sh = "noctalia-shell ipc call sessionMenu toggle";
    "Mod+Space".spawn-sh = "noctalia-shell ipc call launcher toggle";

    "Mod+Return".spawn = "kitty";
    "Mod+Shift+B".spawn = "firefox";
    "Mod+Shift+D".spawn = "discord";
    "Mod+Shift+E".spawn = "zeditor";
    "Mod+Shift+F".spawn = "nautilus";
    "Mod+Shift+M".spawn = "thunderbird";

    "Mod+P".screenshot = _: { };
    "Mod+Shift+P".screenshot-screen = _: { };
    "Mod+Ctrl+P".screenshot-window = _: { };

    "Mod+O".toggle-overview = _: { };

    "Mod+Q".close-window = _: { };

    "Mod+F".fullscreen-window = _: { };

    "Mod+R".switch-preset-column-width = _: { };
    "Mod+Shift+R".maximize-column = _: { };

    "Mod+Plus".set-column-width = "+10%";
    "Mod+Minus".set-column-width = "-10%";

    "Mod+Shift+Plus".set-window-height = "+10%";
    "Mod+Shift+Minus".set-window-height = "-10%";

    "Mod+C".center-column = _: { };
    "Mod+Shift+C".center-visible-columns = _: { };

    "Mod+V".toggle-window-floating = _: { };
    "Mod+Shift+V".switch-focus-between-floating-and-tiling = _: { };

    "Mod+Up".focus-window-up = _: { };
    "Mod+Down".focus-window-down = _: { };
    "Mod+Right".focus-column-right = _: { };
    "Mod+Left".focus-column-left = _: { };

    "Mod+WheelScrollUp".focus-column-left = _: { };
    "Mod+WheelScrollDown".focus-column-right = _: { };
    "Mod+Shift+Up".move-window-up = _: { };
    "Mod+Shift+Down".move-window-down = _: { };
    "Mod+Shift+Right".move-column-right = _: { };
    "Mod+Shift+Left".move-column-left = _: { };

    "Mod+Shift+WheelScrollUp".move-column-left = _: { };
    "Mod+Shift+WheelScrollDown".move-column-right = _: { };

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;
    "Mod+0".focus-workspace = 10;

    "Mod+Shift+1".move-column-to-workspace = 1;
    "Mod+Shift+2".move-column-to-workspace = 2;
    "Mod+Shift+3".move-column-to-workspace = 3;
    "Mod+Shift+4".move-column-to-workspace = 4;
    "Mod+Shift+5".move-column-to-workspace = 5;
    "Mod+Shift+6".move-column-to-workspace = 6;
    "Mod+Shift+7".move-column-to-workspace = 7;
    "Mod+Shift+8".move-column-to-workspace = 8;
    "Mod+Shift+9".move-column-to-workspace = 9;
    "Mod+Shift+0".move-column-to-workspace = 10;

    "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
    "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
  };

  screenshot-path = "~/Pictures/screenshots/screenshot_%Y-%m-%d_%H-%M-%S.png";

  prefer-no-csd = _: { };

  layout = {
    gaps = 16;
    struts = {
      left = 0;
      right = 0;
      top = 0;
      bottom = 0;
    };
    focus-ring = {
      off = _: { };
    };
    border = {
      off = _: { };
    };
    shadow = {
      on = _: { };
      offset = _: {
        props = {
          x = 2;
          y = 2;
        };
      };
      softness = 10;
      spread = 1;
      draw-behind-window = false;
      color = "#000000";
      inactive-color = "#000000";
    };
    tab-indicator = {
      off = _: { };
    };
    default-column-width = {
      proportion = 0.500000;
    };
    preset-column-widths = [
      { proportion = 0.333333; }
      { proportion = 0.500000; }
      { proportion = 0.666667; }
      { proportion = 1.000000; }
    ];
    center-focused-column = "never";
  };

  cursor = {
    xcursor-theme = "Bibata-Modern-Ice";
    xcursor-size = 22;
  };

  hotkey-overlay = {
    skip-at-startup = _: { };
  };

  spawn-at-startup = [ "noctalia-shell" ];

  window-rule = {
    open-fullscreen = false;
    clip-to-geometry = true;
    opacity = 0.900000;
    background-effect = {
      blur = true;
      xray = false;
    };
  };

  layer-rules = [
    {
      matches = [ { namespace = "^noctalia-overview*"; } ];
      place-within-backdrop = true;
    }
  ];
}

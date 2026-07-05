config: with config.theme; {
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

  binds = {
    "Mod+Q".close-window = _: { };
    "Mod+F".fullscreen-window = _: { };

    "Mod+O".toggle-overview = _: { };

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
    "Mod+Left".focus-column-left = _: { };
    "Mod+Right".focus-column-right = _: { };

    "Mod+WheelScrollUp".focus-column-left = _: { };
    "Mod+WheelScrollDown".focus-column-right = _: { };

    "Mod+Shift+Up".move-window-up = _: { };
    "Mod+Shift+Down".move-window-down = _: { };
    "Mod+Shift+Left".move-column-left = _: { };
    "Mod+Shift+Right".move-column-right = _: { };

    "Mod+Shift+WheelScrollUp".move-column-left = _: { };
    "Mod+Shift+WheelScrollDown".move-column-right = _: { };

    "XF86AudioLowerVolume".spawn = [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.05-"
    ];

    "XF86AudioRaiseVolume".spawn = [
      "wpctl"
      "set-volume"
      "@DEFAULT_AUDIO_SINK@"
      "0.05+"
    ];
  }
  // (
    9
    |> builtins.genList (i: i + 1)
    |> builtins.concatMap (n: [
      {
        name = "Mod+${toString n}";
        value.focus-workspace = n;
      }
      {
        name = "Mod+Shift+${toString n}";
        value.move-column-to-workspace = n;
      }
    ])
    |> builtins.listToAttrs
  );

  layout = {
    gaps = 8;
    struts.top = 30;

    background-color = "transparent";

    default-column-width.proportion = 0.5;

    preset-column-widths = [
      { proportion = 1 / 3.0; }
      { proportion = 0.5; }
      { proportion = 2 / 3.0; }
      { proportion = 1.0; }
    ];

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

    tab-indicator.off = _: { };
    focus-ring.off = _: { };
    border.off = _: { };
  };

  animations.slowdown = 0.5;

  prefer-no-csd = _: { };
  hotkey-overlay.skip-at-startup = _: { };

  overview = {
    backdrop-color = colors.base00;
    workspace-shadow.off = _: { };
  };

  window-rule = {
    open-fullscreen = false;
    clip-to-geometry = true;
  };

  layer-rules = [
    {
      matches = [ { namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"; } ];
      background-effect = {
        blur = false;
        xray = false;
      };
    }
  ];
}

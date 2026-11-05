{ fonts }: {
  audio.enable_sounds = false;

  bar =
    let
      common = {
        background_opacity = 0.0;
        capsule_radius = 0;
        font_weight = "bold";
        hover_highlight = false;
        margin_edge = 3;
        margin_ends = 0;
        padding = 10;
        radius = 0;
        reserve_space = false;
        scale = 1.1;
        widget_spacing = 10;
      };
    in
    {
      default = common // {
        capsule_thickness = 0.63;
        center = [ ];
        compositor_blur = false;
        end = [
          "tray"
          "notifications"
          "nightlight"
          "caffeine"
          "volume"
          "bluetooth"
          "network"
          "battery"
        ];
        font_family = fonts.sans;
        layer = "top";
        start = [ "taskbar" ];
        thickness = 23;
      };

      overlay = common // {
        center = [ "clock" ];
        click_through = true;
        end = [ ];
        layer = "overlay";
        start = [ ];
        thickness = 30;
        dead_zone.click_through = true;
      };
    };

  calendar = { };

  control_center = {
    show_avatar_border = false;
    sidebar = "none";
    sidebar_section = "none";
    calendar.show_week_numbers = true;
    shortcuts = map (type: { inherit type; }) [
      "wifi"
      "bluetooth"
      "audio"
      "mic_mute"
      "system"
      "screen_time"
    ];
  };

  desktop_widgets.enabled = false;

  idle = {
    behavior_order = [
      "lock"
      "screen-off"
      "lock-and-suspend"
    ];
    behavior = {
      lock = {
        action = "lock";
        enabled = true;
        timeout = 300.0;
      };
      lock_and_suspend = {
        action = "lock_and_suspend";
        enable = true;
        timeout = 600;
      };
      screen-off = {
        action = "screen_off";
        enabled = true;
        timeout = 360.0;
      };
    };
  };

  location.auto_locate = true;

  lockscreen_widgets =
    let
      outputs = [
        "DP-1"
        "DP-2"
        "HDMI-A-1"
      ];

      widgetKinds = [
        {
          kind = "login-box";
          build = output: {
            box_height = 70.0;
            box_width = 400.0;
            cx = 960.0;
            cy = 895.0;
            placement_height = 1080.0;
            placement_width = 1920.0;
            rotation = 0.0;
            type = "login_box";
            inherit output;
            settings = {
              background_color = "surface";
              background_opacity = 0.0;
              background_radius = 0.0;
              center_password_text = true;
              input_opacity = 0.0;
              input_radius = 0.0;
              layout = "compact";
              show_caps_lock = true;
              show_keyboard_layout = false;
              show_login_button = false;
              show_media = false;
              show_password_reveal = false;
              show_session_buttons = false;
              show_unlock_hint = false;
              show_weather = false;
            };
          };
        }
      ];

      widgets = builtins.concatMap (
        w:
        map (output: {
          name = "${w.kind}@${output}";
          value = w.build output;
        }) (w.on or outputs)
      ) widgetKinds;
    in
    {
      enabled = true;
      schema_version = 2;

      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };

      widget = builtins.listToAttrs widgets;
      widget_order = map (w: w.name) widgets;
    };

  nightlight.enabled = true;

  notification = {
    border = false;
    offset_y = 38;
  };

  osd = {
    border = false;
    offset_y = 38;
  };

  shell = {
    button_borders = false;
    card_borders = false;
    corner_radius_scale = 0.0;
    font_family = fonts.sans;
    input_borders = false;
    launch_apps_as_systemd_services = true;
    niri_overview_type_to_launch_enabled = true;
    polkit_agent = true;
    popup_borders = false;
    screen_time_enabled = true;
    settings_show_advanced = true;
    setup_wizard_enabled = false;
    telemetry_enabled = true;

    animation.enabled = false;

    launcher = {
      categories = false;
      layout = "simple";
    };

    panel = {
      borders = false;
      control_center_placement = "floating";
      floating_offset = 12;
      open_near_click_control_center = true;
      session_placement = "floating";
      session_position = "center";
      transparency_mode = "soft";
    };

    screenshot = {
      annotate = true;
      confirm_region = true;
      copy_on_close = true;
      directory = "/home/linus/Pictures/screenshots";
      show_cursor = true;
    };
  };

  theme = {
    custom_palette = "palette";
    mode = "dark";
    source = "custom";
  };

  wallpaper.enabled = false;

  widget = {
    clock.format = "{:%A  %H:%M}";
    network.show_label = false;
    taskbar = {
      empty_color = "tertiary";
      group_by_workspace = true;
      hide_empty_workspaces = true;
      inactive_opacity = 0.8;
      occupied_color = "tertiary";
      scale = 1.1;
      show_active_indicator = false;
      workspace_group_capsule = false;
    };
    tray.drawer = true;
    volume.show_label = false;
  };
}

config: with config.theme; {
  shell = {
    button_borders = false;
    corner_radius_scale = 0.0;
    font_family = fonts.sans;

    launch_apps_as_systemd_services = true;
    niri_overview_type_to_launch_enabled = true;

    polkit_agent = true;
    screen_time_enabled = true;
    telemetry_enabled = true;
    settings_show_advanced = true;
    setup_wizard_enabled = false;

    screenshot.directory = "/home/linus/Pictures/screenshots";

    panel = {
      borders = false;
      floating_offset = 5;
      open_near_click_control_center = true;
      control_center_placement = "floating";
      session_placement = "floating";
      session_position = "center";
      transparency_mode = "soft";
    };

    launcher.categories = false;
  };

  control_center = {
    sidebar = "none";
    sidebar_section = "none";

    shortcuts = [
      { type = "wifi"; }
      { type = "bluetooth"; }
      { type = "audio"; }
      { type = "mic_mute"; }
      { type = "system"; }
      { type = "screen_time"; }
    ];
  };

  location.auto_locate = true;
  nightlight.enabled = true;

  theme = {
    mode = "dark";
    source = "custom";
    custom_palette = "palette";
  };

  bar =
    let
      common = {
        reserve_space = false;
        hover_highlight = false;
        background_opacity = 0.0;
        scale = 1.1;
        thickness = 30;
        font_weight = "bold";
        margin_edge = 3;
        margin_ends = 0;
        padding = 10;
        widget_spacing = 10;
        radius = 0;
        capsule_radius = 0;
      };
    in
    {
      overlay = common // {
        click_through = true;
        layer = "overlay";
        start = [ ];
        center = [ "clock" ];
        end = [ ];
      };

      default = common // {
        layer = "top";
        start = [ "taskbar" ];
        center = [ ];
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
      };
    };

  widget = {
    clock.format = "{:%A  %H:%M}";

    tray.drawer = true;

    network.show_label = false;
    volume.show_label = false;

    taskbar = {
      scale = 1.1;
      group_by_workspace = true;
      hide_empty_workspaces = true;
      inactive_opacity = 0.8;
      show_active_indicator = false;
      workspace_group_capsule = false;
    };
  };
}

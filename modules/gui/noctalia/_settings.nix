{ self }:
{
  shell = {
    corner_radius_scale = 0.0;
    font_family = self.fonts.sans;
    screen_time_enabled = true;
    launch_apps_as_systemd_services = true;
    niri_overview_type_to_launch_enabled = true;

    panel = {
      launcher_categories = false;
      open_near_click_control_center = true;
      session_placement = "centered";
      transparency_mode = "soft";
    };

    screenshot.directory = "/home/linus/Pictures/screenshots";

    settings_show_advanced = true;
    setup_wizard_enabled = false;
    telemetry_enabled = false;
  };

  control_center.shortcuts = [
    { type = "power_profile"; }
    { type = "system"; }
    { type = "screen_recorder"; }
    { type = "wallpaper"; }
  ];

  location.auto_locate = true;

  backdrop.enabled = true;

  nightlight.enabled = true;

  theme = {
    mode = "dark";
    source = "custom";
    custom_palette = "palette";
  };

  wallpaper = {
    directory = "/home/linus/Pictures";
    default.path = "/home/linus/Pictures/wp15769140-linkin-park-from-zero-wallpapers.png";
  };

  bar.default = {
    background_opacity = 0.9;
    scale = 1.1;
    font_weight = "bold";
    margin_edge = 0;
    margin_ends = 0;
    padding = 10;
    widget_spacing = 10;
    radius = 0;
    capsule_radius = 0;
    start = [
      "taskbar"
    ];
    center = [
      "clock"
    ];
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

  widget = {
    clock.format = "{:%A  %H:%M}";

    tray.drawer = true;

    network.show_label = false;

    volume.show_label = false;

    screen_recorder = {
      script = "scripts/screen_recorder.lua";
      type = "scripted";
    };

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

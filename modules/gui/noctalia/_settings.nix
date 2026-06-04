{ self }:
{
  backdrop = {
    enabled = true;
  };

  bar.default = {
    auto_hide = true;
    background_opacity = 0.9;
    center = [
      "clock"
    ];
    end = [
      "tray"
      "notifications"
      "screen_recorder"
      "nightlight"
      "caffeine"
      "volume"
      "bluetooth"
      "network"
      "battery"
    ];
    font_weight = "bold";
    margin_edge = 0;
    margin_ends = 0;
    padding = 10;
    radius = 0;
    start = [ "taskbar" ];
    widget_spacing = 10;
  };

  nightlight = {
    enabled = true;
  };

  shell = {
    setup_wizard_enabled = false;
    corner_radius_scale = 0.0;
    font_family = self.fonts.sans;
    niri_overview_type_to_launch_enabled = true;
    settings_show_advanced = true;
    screen_time_enabled = true;
    launch_apps_as_systemd_services = true;
    telemetry_enabled = false;

    panel = {
      open_near_click_control_center = true;
      session_placement = "centered";
      launcher_categories = false;
      transparency_mode = "soft";
    };

    control_center = {
      sidebar = "none";
      shortcuts = [
        "screen_time"
        "wallpaper"
        "sysmon"
        "power_profile"
      ];
    };
  };

  theme = {
    mode = "dark";
    source = "custom";
    custom_palette = "palette";
    templates = {
      enable_builtin_templates = false;
      enable_community_templates = false;
    };
  };

  wallpaper = {
    directory = "/home/linus/Pictures";
    default.path = "/home/linus/Pictures/wp15769140-linkin-park-from-zero-wallpapers.png";
  };

  weather = {
    address = "Bern, Switzerland";
  };

  widget = {
    clock = {
      format = "{:%A  %H:%M}";
    };

    network = {
      show_label = false;
    };

    screen_recorder = {
      script = "scripts/screen_recorder.lua";
      type = "scripted";
    };

    taskbar = {
      capsule_radius = 1.0;
      group_by_workspace = true;
    };

    tray = {
      drawer = true;
    };

    volume = {
      show_label = false;
    };

    taskbar = {
      hide_empty_workspaces = true;
      inactive_opacity = 0.80000000000000004;
      show_active_indicator = false;
      workspace_group_capsule = false;
    };
  };
}

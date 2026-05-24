{ self }:
{
  backdrop = {
    enabled = true;
  };

  bar.default = {
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
    start = [ "workspaces" ];
    widget_spacing = 10;
  };

  nightlight = {
    enabled = true;
  };

  shell = {
    corner_radius_scale = 0.0;
    font_family = self.fonts.sans;
    niri_overview_type_to_launch_enabled = true;
    settings_show_advanced = true;
    launch_apps_as_systemd_services = true;
    telemetry_enabled = false;

    panel = {
      open_near_click_control_center = true;
      session_placement = "centered";
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

    workspaces = {
      capsule_radius = 0.0;
      empty_color = "#FFFFFF";
      focused_color = "#FFFFFF";
      occupied_color = "#FFFFFF";
    };
  };
}

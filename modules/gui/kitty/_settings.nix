{ colors }: {
  window_padding_width = 0;
  hide_window_decorations = "yes";
  confirm_os_window_close = 0;

  enabled_layouts = "splits,stack";
  window_border_width = "1px";
  draw_minimal_borders = "yes";
  window_margin_width = 0;
  single_window_margin_width = -1;
  inactive_text_alpha = 1;
  scrollback_lines = 50000;
  allow_remote_control = "socket-only";
  listen_on = "unix:@kitty-{kitty_pid}";
  clipboard_control = "write-clipboard write-primary read-clipboard-ask read-primary-ask";
  shell_integration = "enabled";

  tab_bar_edge = "top";
  tab_bar_style = "separator";
  tab_separator = "\"\"";
  tab_title_template = "\" {index} {title}{' Z' if layout_name == 'stack' else ''} \"";
  active_tab_font_style = "bold";
  tab_bar_min_tabs = 1;
  tab_bar_background = colors.base00;

  cursor_shape = "beam";
  cursor_shape_unfocused = "beam";
  cursor_blink_interval = 0;
  enable_audio_bell = "no";

  background = colors.base00;
  foreground = colors.base05;
  selection_background = colors.base05;
  selection_foreground = colors.base00;
  url_color = colors.base0D;
  cursor = colors.base0D;
  cursor_text_color = colors.base00;
  active_border_color = colors.base0D;
  inactive_border_color = colors.base02;
  active_tab_background = colors.base02;
  active_tab_foreground = colors.base07;
  inactive_tab_background = colors.base00;
  inactive_tab_foreground = colors.base04;

  color0 = colors.base00;
  color1 = colors.base08;
  color2 = colors.base0B;
  color3 = colors.base0A;
  color4 = colors.base0D;
  color5 = colors.base0E;
  color6 = colors.base0C;
  color7 = colors.base05;
  color8 = colors.base03;
  color9 = colors.base08;
  color10 = colors.base0B;
  color11 = colors.base0A;
  color12 = colors.base0D;
  color13 = colors.base0E;
  color14 = colors.base0C;
  color15 = colors.base07;
  color16 = colors.base09;
  color17 = colors.base0F;
  color18 = colors.base01;
  color19 = colors.base02;
  color20 = colors.base04;
  color21 = colors.base06;
}

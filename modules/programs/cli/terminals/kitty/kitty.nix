{
  flake.modules.homeManager.kitty = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration.enableFishIntegration = true;

      settings = {
        cursor_shape = "beam";
        cursor_shape_unfocused = "beam";
        cursor_trail = 1;
        confirm_os_window_close = 0;
        hide_window_decorations = true;
        show_window_resize_notification = false;
      };

      extraConfig = ''
        include ./themes/noctalia.conf
        window_padding_width 0 20
      '';
    };
  };
}

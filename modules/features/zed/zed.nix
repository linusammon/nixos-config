{
  flake.modules.homeManager.zed =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        enable = true;

        userSettings = {
          "experimental.theme_overrides" = {
            "border" = "#111215ff";
          };
          "auto_update" = false;
          "base_keymap" = "VSCode";
          "completions" = {
            "words_min_length" = 0;
          };
          "current_line_highlight" = "none";
          "cursor_blink" = false;
          "disable_ai" = true;
          "git" = {
            "inline_blame" = {
              "enabled" = false;
            };
          };
          "gutter" = {
            "breakpoints" = false;
            "folds" = false;
            "min_line_number_digits" = 0;
            "runnables" = false;
          };
          "helix_mode" = true;
          "icon_theme" = {
            "dark" = "Colored Zed Icons Theme Dark";
            "light" = "Colored Zed Icons Theme Light";
            "mode" = "dark";
          };
          "project_panel" = {
            "auto_fold_dirs" = false;
            "sticky_scroll" = false;
          };
          "relative_line_numbers" = "enabled";
          "rounded_selection" = false;
          "scrollbar" = {
            "show" = "never";
          };
          "session" = {
            "trust_all_worktrees" = true;
          };
          "show_whitespaces" = "none";
          "tab_size" = 2;
          "telemetry" = {
            "diagnostics" = false;
            "metrics" = false;
          };
          "terminal" = {
            "button" = false;
            "cursor_shape" = "bar";
            "toolbar" = {
              "breadcrumbs" = false;
            };
          };
          "notification_panel" = {
            "button" = false;
          };
          "debugger" = {
            "button" = false;
          };
          "collaboration_panel" = {
            "button" = false;
          };
          "search" = {
            "button" = false;
          };
          "outline_panel" = {
            "button" = false;
          };
          "title_bar" = {
            "show_onboarding_banner" = false;
          };
          "toolbar" = {
            "breadcrumbs" = false;
            "quick_actions" = false;
            "selections_menu" = true;
          };
          "vertical_scroll_margin" = 5.0;
          "window_decorations" = "server";
        };

        extensions = [
          "colored-zed-icons-theme"
          "nix"
        ];

        extraPackages = with pkgs; [
          nil
          nixd
        ];

        mutableUserKeymaps = false;
        mutableUserDebug = false;
        mutableUserSettings = false;
        mutableUserTasks = false;
      };

      home.persistence."/persistent".directories = [
        ".local/share/zed"
      ];
    };
}

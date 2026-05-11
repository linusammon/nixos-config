{ self }:
{
  edit_predictions = {
    provider = "ollama";
    ollama = {
      prompt_format = "qwen";
      model = "qwen3.6:latest";
    };
  };
  agent = {
    sidebar_side = "right";
    dock = "right";
    default_model = {
      provider = "ollama";
      model = "qwen3.6:latest";
      enable_thinking = true;
    };
    flexible = true;
    favorite_models = [ ];
    model_parameters = [ ];
  };
  disable_ai = false;
  auto_install_extensions = {
    colored-zed-icons-theme = true;
    nix = true;
  };
  auto_update = false;
  base_keymap = "VSCode";
  buffer_font_family = self.fonts.mono;
  buffer_font_size = self.fonts.size * 4.0 / 3.0;
  collaboration_panel = {
    button = false;
  };
  completions = {
    words_min_length = 0;
  };
  current_line_highlight = "none";
  cursor_blink = false;
  debugger = {
    button = false;
  };
  git = {
    inline_blame = {
      enabled = false;
    };
  };
  git_panel = {
    dock = "left";
  };
  gutter = {
    breakpoints = false;
    folds = false;
    min_line_number_digits = 0;
    runnables = false;
  };
  helix_mode = true;
  icon_theme = {
    dark = "Colored Zed Icons Theme Dark";
    light = "Colored Zed Icons Theme Light";
    mode = "dark";
  };
  outline_panel = {
    button = false;
  };
  project_panel = {
    auto_fold_dirs = false;
    dock = "left";
    sticky_scroll = false;
  };
  relative_line_numbers = "enabled";
  rounded_selection = false;
  scrollbar = {
    show = "never";
  };
  search = {
    button = false;
  };
  session = {
    trust_all_worktrees = true;
  };
  show_whitespaces = "none";
  tab_size = 2;
  telemetry = {
    diagnostics = false;
    metrics = false;
  };
  terminal = {
    button = false;
    cursor_shape = "bar";
    toolbar = {
      breadcrumbs = false;
    };
  };
  theme = {
    dark = "Base16";
    light = "Base16";
    mode = "system";
  };
  title_bar = {
    show_onboarding_banner = false;
  };
  toolbar = {
    breadcrumbs = false;
    quick_actions = false;
    selections_menu = true;
  };
  ui_font_family = self.fonts.sans;
  ui_font_size = self.fonts.size * 4.0 / 3.0;
  vertical_scroll_margin = 5.0;
  window_decorations = "server";
}

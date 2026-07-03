[
  {
    context = "Workspace";
    bindings = {
      "ctrl-space t" = "terminal_panel::Toggle";
      "ctrl-space d" = "debug_panel::Toggle";
      "ctrl-space o" = "outline_panel::Toggle";
      "ctrl-space f" = "project_panel::Toggle";
      "ctrl-space g" = "git_panel::Toggle";
      "ctrl-space e" = "editor::ToggleFocus";
    };
    unbind = {
      "ctrl-\`" = "terminal_panel::Toggle";
    };
  }
  {
    context = "OutlinePanel && not_editing";
    unbind = {
      "enter" = "editor::ToggleFocus";
    };
  }
]

{ self }:
{
  "$schema" = "https://zed.dev/schema/themes/v0.1.0.json";
  name = "base16";
  author = "";
  themes = [
    {
      name = "Base16";
      appearance = "dark";
      style = {
        "border" = self.theme.base00;
        "border.variant" = self.theme.base00;
        "border.focused" = null;
        "border.selected" = null;
        "border.transparent" = null;
        "border.disabled" = null;
        "elevated_surface.background" = self.theme.base00;
        "surface.background" = self.theme.base00;
        "background" = self.theme.base00;
        "element.background" = self.theme.base01;
        "element.hover" = self.theme.base02;
        "element.active" = null;
        "element.selected" = self.theme.base02;
        "element.disabled" = null;
        "drop_target.background" = self.theme.base02;
        "ghost_element.background" = null;
        "ghost_element.hover" = self.theme.base01;
        "ghost_element.active" = null;
        "ghost_element.selected" = self.theme.base02;
        "ghost_element.disabled" = null;
        "text" = self.theme.base05;
        "text.muted" = self.theme.base04;
        "text.placeholder" = self.theme.base07;
        "text.disabled" = self.theme.base02;
        "text.accent" = self.theme.base0C;
        "icon" = null;
        "icon.muted" = null;
        "icon.disabled" = null;
        "icon.placeholder" = null;
        "icon.accent" = null;
        "status_bar.background" = self.theme.base00;
        "title_bar.background" = self.theme.base00;
        "title_bar.inactive_background" = self.theme.base00;
        "toolbar.background" = self.theme.base00;
        "tab_bar.background" = self.theme.base00;
        "tab.inactive_background" = self.theme.base00;
        "tab.active_background" = self.theme.base01;
        "search.match_background" = self.theme.base02;
        "panel.background" = self.theme.base00;
        "panel.focused_border" = self.theme.base02;
        "pane.focused_border" = null;
        "scrollbar.thumb.background" = self.theme.base02;
        "scrollbar.thumb.hover_background" = self.theme.base03;
        "scrollbar.thumb.border" = "${self.theme.base02}6f";
        "scrollbar.track.background" = self.theme.base00;
        "scrollbar.track.border" = null;
        "editor.foreground" = self.theme.base05;
        "editor.background" = self.theme.base00;
        "editor.gutter.background" = self.theme.base00;
        "editor.subheader.background" = self.theme.base00;
        "editor.active_line.background" = self.theme.base01;
        "editor.highlighted_line.background" = null;
        "editor.line_number" = self.theme.base03;
        "editor.active_line_number" = self.theme.base06;
        "editor.invisible" = null;
        "editor.wrap_guide" = self.theme.base01;
        "editor.active_wrap_guide" = self.theme.base06;
        "editor.document_highlight.read_background" = self.theme.base01;
        "editor.document_highlight.write_background" = self.theme.base01;
        "terminal.background" = self.theme.base00;
        "terminal.foreground" = null;
        "terminal.bright_foreground" = null;
        "terminal.dim_foreground" = null;
        "terminal.ansi.black" = self.theme.base00;
        "terminal.ansi.bright_black" = self.theme.base03;
        "terminal.ansi.dim_black" = null;
        "terminal.ansi.red" = self.theme.base08;
        "terminal.ansi.bright_red" = self.theme.base08;
        "terminal.ansi.dim_red" = null;
        "terminal.ansi.green" = self.theme.base0B;
        "terminal.ansi.bright_green" = self.theme.base0B;
        "terminal.ansi.dim_green" = null;
        "terminal.ansi.yellow" = self.theme.base0A;
        "terminal.ansi.bright_yellow" = self.theme.base0A;
        "terminal.ansi.dim_yellow" = null;
        "terminal.ansi.blue" = self.theme.base0D;
        "terminal.ansi.bright_blue" = self.theme.base0D;
        "terminal.ansi.dim_blue" = null;
        "terminal.ansi.magenta" = self.theme.base0E;
        "terminal.ansi.bright_magenta" = self.theme.base0E;
        "terminal.ansi.dim_magenta" = null;
        "terminal.ansi.cyan" = self.theme.base0C;
        "terminal.ansi.bright_cyan" = self.theme.base0C;
        "terminal.ansi.dim_cyan" = null;
        "terminal.ansi.white" = self.theme.base05;
        "terminal.ansi.bright_white" = self.theme.base07;
        "terminal.ansi.dim_white" = null;
        "link_text.hover" = self.theme.base0C;
        "conflict" = self.theme.base0A;
        "conflict.background" = self.theme.base00;
        "conflict.border" = self.theme.base0A;
        "created" = self.theme.base0B;
        "created.background" = self.theme.base00;
        "created.border" = self.theme.base0B;
        "deleted" = self.theme.base08;
        "deleted.background" = self.theme.base00;
        "deleted.border" = self.theme.base08;
        "error" = self.theme.base08;
        "error.background" = self.theme.base00;
        "error.border" = self.theme.base08;
        "hidden" = self.theme.base03;
        "hidden.background" = self.theme.base00;
        "hidden.border" = self.theme.base03;
        "hint" = self.theme.base05;
        "hint.background" = self.theme.base00;
        "hint.border" = self.theme.base0C;
        "ignored" = self.theme.base03;
        "ignored.background" = self.theme.base00;
        "ignored.border" = self.theme.base03;
        "info" = self.theme.base0C;
        "info.background" = self.theme.base00;
        "info.border" = self.theme.base0C;
        "modified" = self.theme.base0D;
        "modified.background" = self.theme.base00;
        "modified.border" = self.theme.base0D;
        "predictive" = self.theme.base03;
        "predictive.background" = self.theme.base01;
        "predictive.border" = self.theme.base02;
        "renamed" = self.theme.base0A;
        "renamed.background" = self.theme.base00;
        "renamed.border" = self.theme.base0A;
        "success" = self.theme.base0B;
        "success.background" = self.theme.base00;
        "success.border" = self.theme.base0B;
        "unreachable" = self.theme.base0A;
        "unreachable.background" = self.theme.base00;
        "unreachable.border" = self.theme.base0A;
        "warning" = self.theme.base0A;
        "warning.background" = self.theme.base00;
        "warning.border" = self.theme.base0A;
        "players" = [
          {
            "cursor" = self.theme.base05;
            "selection" = self.theme.base02;
            "background" = null;
          }
        ];
        "syntax" = {
          "attribute" = {
            "color" = self.theme.base0D;
            "font_style" = null;
            "font_weight" = null;
          };
          "boolean" = {
            "color" = self.theme.base09;
            "font_style" = null;
            "font_weight" = null;
          };
          "comment" = {
            "color" = self.theme.base03;
            "font_style" = "italic";
            "font_weight" = null;
          };
          "comment.doc" = {
            "color" = self.theme.base03;
            "font_style" = "italic";
            "font_weight" = null;
          };
          "constant" = {
            "color" = self.theme.base09;
            "font_style" = null;
            "font_weight" = null;
          };
          "constructor" = {
            "color" = self.theme.base06;
            "font_style" = null;
            "font_weight" = null;
          };
          "emphasis" = {
            "color" = self.theme.base06;
            "font_style" = "italic";
            "font_weight" = null;
          };
          "emphasis.strong" = {
            "color" = self.theme.base06;
            "font_style" = null;
            "font_weight" = 700;
          };
          "function" = {
            "color" = self.theme.base0D;
            "font_style" = null;
            "font_weight" = null;
          };
          "keyword" = {
            "color" = self.theme.base0E;
            "font_style" = null;
            "font_weight" = null;
          };
          "label" = {
            "color" = self.theme.base0A;
            "font_style" = null;
            "font_weight" = null;
          };
          "link_text" = {
            "color" = self.theme.base06;
            "font_style" = null;
            "font_weight" = null;
          };
          "link_uri" = {
            "color" = self.theme.base06;
            "font_style" = null;
            "font_weight" = null;
          };
          "number" = {
            "color" = self.theme.base09;
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation" = {
            "color" = self.theme.base05;
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.bracket" = {
            "color" = self.theme.base05;
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.delimiter" = {
            "color" = self.theme.base05;
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.list_marker" = {
            "color" = self.theme.base05;
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.special" = {
            "color" = self.theme.base05;
            "font_style" = null;
            "font_weight" = null;
          };
          "string" = {
            "color" = self.theme.base0B;
            "font_style" = null;
            "font_weight" = null;
          };
          "string.escape" = {
            "color" = self.theme.base09;
            "font_style" = null;
            "font_weight" = null;
          };
          "string.regex" = {
            "color" = self.theme.base0B;
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special" = {
            "color" = self.theme.base0B;
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special.symbol" = {
            "color" = self.theme.base0B;
            "font_style" = null;
            "font_weight" = null;
          };
          "tag" = {
            "color" = self.theme.base08;
            "font_style" = null;
            "font_weight" = null;
          };
          "text.literal" = {
            "color" = self.theme.base0B;
            "font_style" = null;
            "font_weight" = null;
          };
          "title" = {
            "color" = self.theme.base0A;
            "font_style" = null;
            "font_weight" = null;
          };
          "type" = {
            "color" = self.theme.base0A;
            "font_style" = null;
            "font_weight" = null;
          };
          "variable" = {
            "color" = self.theme.base06;
            "font_style" = null;
            "font_weight" = null;
          };
          "variable.special" = {
            "color" = self.theme.base06;
            "font_style" = "italic";
            "font_weight" = null;
          };
        };
      };
    }
  ];
}

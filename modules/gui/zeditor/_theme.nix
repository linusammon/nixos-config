{ self }:
{
  "$schema" = "https://zed.dev/schema/themes/v0.2.0.json";
  name = "base16";
  author = "";
  themes = [
    {
      "name" = "Base16";
      "appearance" = "dark";
      "style" = {
        "border" = "${self.theme.base00}ff";
        "border.variant" = "${self.theme.base00}ff";
        "border.focused" = "${self.theme.base00}ff";
        "border.selected" = "${self.theme.base00}ff";
        "border.transparent" = "#00000000";
        "border.disabled" = "${self.theme.base03}ff";
        "elevated_surface.background" = "${self.theme.base01}ff";
        "surface.background" = "${self.theme.base00}ff";
        "background" = "${self.theme.base00}ff";
        "element.background" = "${self.theme.base01}ff";
        "element.hover" = "${self.theme.base02}ff";
        "element.active" = "${self.theme.base02}ff";
        "element.selected" = "${self.theme.base02}ff";
        "element.disabled" = "${self.theme.base01}ff";
        "drop_target.background" = "${self.theme.base03}80";
        "ghost_element.background" = "#00000000";
        "ghost_element.hover" = "${self.theme.base02}ff";
        "ghost_element.active" = "${self.theme.base02}ff";
        "ghost_element.selected" = "${self.theme.base02}ff";
        "ghost_element.disabled" = "${self.theme.base01}ff";
        "text" = "${self.theme.base05}ff";
        "text.muted" = "${self.theme.base04}ff";
        "text.placeholder" = "${self.theme.base03}ff";
        "text.disabled" = "${self.theme.base03}ff";
        "text.accent" = "${self.theme.base0D}ff";
        "icon" = "${self.theme.base05}ff";
        "icon.muted" = "${self.theme.base04}ff";
        "icon.disabled" = "${self.theme.base03}ff";
        "icon.placeholder" = "${self.theme.base04}ff";
        "icon.accent" = "${self.theme.base0D}ff";
        "status_bar.background" = "${self.theme.base00}ff";
        "title_bar.background" = "${self.theme.base00}ff";
        "title_bar.inactive_background" = "${self.theme.base00}ff";
        "toolbar.background" = "${self.theme.base00}ff";
        "tab_bar.background" = "${self.theme.base00}ff";
        "tab.inactive_background" = "${self.theme.base00}ff";
        "tab.active_background" = "${self.theme.base00}ff";
        "search.match_background" = "${self.theme.base0A}66";
        "search.active_match_background" = "${self.theme.base09}66";
        "panel.background" = "${self.theme.base00}ff";
        "panel.focused_border" = null;
        "pane.focused_border" = null;
        "scrollbar.thumb.background" = "${self.theme.base04}4c";
        "scrollbar.thumb.hover_background" = "${self.theme.base02}ff";
        "scrollbar.thumb.border" = "${self.theme.base02}ff";
        "scrollbar.track.background" = "#00000000";
        "scrollbar.track.border" = "${self.theme.base01}ff";
        "editor.foreground" = "${self.theme.base05}ff";
        "editor.background" = "${self.theme.base00}ff";
        "editor.gutter.background" = "${self.theme.base00}ff";
        "editor.subheader.background" = "${self.theme.base01}ff";
        "editor.active_line.background" = "${self.theme.base01}80";
        "editor.highlighted_line.background" = "${self.theme.base01}ff";
        "editor.line_number" = "${self.theme.base03}ff";
        "editor.active_line_number" = "${self.theme.base05}ff";
        "editor.hover_line_number" = "${self.theme.base04}ff";
        "editor.invisible" = "${self.theme.base03}ff";
        "editor.wrap_guide" = "${self.theme.base02}0d";
        "editor.active_wrap_guide" = "${self.theme.base02}1a";
        "editor.document_highlight.read_background" = "${self.theme.base0D}1a";
        "editor.document_highlight.write_background" = "${self.theme.base02}66";
        "terminal.background" = "${self.theme.base00}ff";
        "terminal.foreground" = "${self.theme.base05}ff";
        "terminal.bright_foreground" = "${self.theme.base07}ff";
        "terminal.dim_foreground" = "${self.theme.base03}ff";
        "terminal.ansi.black" = "${self.theme.base00}ff";
        "terminal.ansi.bright_black" = "${self.theme.base03}ff";
        "terminal.ansi.dim_black" = "${self.theme.base00}ff";
        "terminal.ansi.red" = "${self.theme.base08}ff";
        "terminal.ansi.bright_red" = "${self.theme.base08}ff";
        "terminal.ansi.dim_red" = "${self.theme.base08}bf";
        "terminal.ansi.green" = "${self.theme.base0B}ff";
        "terminal.ansi.bright_green" = "${self.theme.base0B}ff";
        "terminal.ansi.dim_green" = "${self.theme.base0B}bf";
        "terminal.ansi.yellow" = "${self.theme.base0A}ff";
        "terminal.ansi.bright_yellow" = "${self.theme.base0A}ff";
        "terminal.ansi.dim_yellow" = "${self.theme.base0A}bf";
        "terminal.ansi.blue" = "${self.theme.base0D}ff";
        "terminal.ansi.bright_blue" = "${self.theme.base0D}ff";
        "terminal.ansi.dim_blue" = "${self.theme.base0D}bf";
        "terminal.ansi.magenta" = "${self.theme.base0E}ff";
        "terminal.ansi.bright_magenta" = "${self.theme.base0E}ff";
        "terminal.ansi.dim_magenta" = "${self.theme.base0E}bf";
        "terminal.ansi.cyan" = "${self.theme.base0C}ff";
        "terminal.ansi.bright_cyan" = "${self.theme.base0C}ff";
        "terminal.ansi.dim_cyan" = "${self.theme.base0C}bf";
        "terminal.ansi.white" = "${self.theme.base05}ff";
        "terminal.ansi.bright_white" = "${self.theme.base07}ff";
        "terminal.ansi.dim_white" = "${self.theme.base04}ff";
        "link_text.hover" = "${self.theme.base0D}ff";
        "version_control.added" = "${self.theme.base0B}ff";
        "version_control.modified" = "${self.theme.base0A}ff";
        "version_control.word_added" = "${self.theme.base0B}59";
        "version_control.word_deleted" = "${self.theme.base08}cc";
        "version_control.deleted" = "${self.theme.base08}ff";
        "version_control.conflict_marker.ours" = "${self.theme.base0B}1a";
        "version_control.conflict_marker.theirs" = "${self.theme.base0D}1a";
        "conflict" = "${self.theme.base0A}ff";
        "conflict.background" = "${self.theme.base0A}1a";
        "conflict.border" = "${self.theme.base0A}80";
        "created" = "${self.theme.base0B}ff";
        "created.background" = "${self.theme.base0B}1a";
        "created.border" = "${self.theme.base0B}80";
        "deleted" = "${self.theme.base08}ff";
        "deleted.background" = "${self.theme.base08}1a";
        "deleted.border" = "${self.theme.base08}80";
        "error" = "${self.theme.base08}ff";
        "error.background" = "${self.theme.base08}1a";
        "error.border" = "${self.theme.base08}80";
        "hidden" = "${self.theme.base03}ff";
        "hidden.background" = "${self.theme.base02}1a";
        "hidden.border" = "${self.theme.base02}ff";
        "hint" = "${self.theme.base0C}ff";
        "hint.background" = "${self.theme.base0C}1a";
        "hint.border" = "${self.theme.base0C}80";
        "ignored" = "${self.theme.base03}ff";
        "ignored.background" = "${self.theme.base02}1a";
        "ignored.border" = "${self.theme.base02}ff";
        "info" = "${self.theme.base0D}ff";
        "info.background" = "${self.theme.base0D}1a";
        "info.border" = "${self.theme.base0D}80";
        "modified" = "${self.theme.base0A}ff";
        "modified.background" = "${self.theme.base0A}1a";
        "modified.border" = "${self.theme.base0A}80";
        "predictive" = "${self.theme.base03}ff";
        "predictive.background" = "${self.theme.base03}1a";
        "predictive.border" = "${self.theme.base03}80";
        "renamed" = "${self.theme.base0D}ff";
        "renamed.background" = "${self.theme.base0D}1a";
        "renamed.border" = "${self.theme.base0D}80";
        "success" = "${self.theme.base0B}ff";
        "success.background" = "${self.theme.base0B}1a";
        "success.border" = "${self.theme.base0B}80";
        "unreachable" = "${self.theme.base04}ff";
        "unreachable.background" = "${self.theme.base03}1a";
        "unreachable.border" = "${self.theme.base03}ff";
        "warning" = "${self.theme.base0A}ff";
        "warning.background" = "${self.theme.base0A}1a";
        "warning.border" = "${self.theme.base0A}80";
        "players" = [
          {
            "cursor" = "${self.theme.base0D}ff";
            "background" = "${self.theme.base0D}20";
            "selection" = "${self.theme.base0D}30";
          }
          {
            "cursor" = "${self.theme.base0E}ff";
            "background" = "${self.theme.base0E}20";
            "selection" = "${self.theme.base0E}30";
          }
          {
            "cursor" = "${self.theme.base08}ff";
            "background" = "${self.theme.base08}20";
            "selection" = "${self.theme.base08}30";
          }
          {
            "cursor" = "${self.theme.base09}ff";
            "background" = "${self.theme.base09}20";
            "selection" = "${self.theme.base09}30";
          }
          {
            "cursor" = "${self.theme.base0A}ff";
            "background" = "${self.theme.base0A}20";
            "selection" = "${self.theme.base0A}30";
          }
          {
            "cursor" = "${self.theme.base0B}ff";
            "background" = "${self.theme.base0B}20";
            "selection" = "${self.theme.base0B}30";
          }
          {
            "cursor" = "${self.theme.base0C}ff";
            "background" = "${self.theme.base0C}20";
            "selection" = "${self.theme.base0C}30";
          }
          {
            "cursor" = "${self.theme.base0F}ff";
            "background" = "${self.theme.base0F}20";
            "selection" = "${self.theme.base0F}30";
          }
        ];
        "syntax" = {
          "attribute" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "boolean" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "comment" = {
            "color" = "${self.theme.base03}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "comment.doc" = {
            "color" = "${self.theme.base04}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "constant" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "constructor" = {
            "color" = "${self.theme.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "embedded" = {
            "color" = "${self.theme.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "emphasis" = {
            "color" = "${self.theme.base0E}ff";
            "font_style" = "italic";
            "font_weight" = null;
          };
          "emphasis.strong" = {
            "color" = "${self.theme.base0A}ff";
            "font_style" = null;
            "font_weight" = 700;
          };
          "enum" = {
            "color" = "${self.theme.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "function" = {
            "color" = "${self.theme.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "hint" = {
            "color" = "${self.theme.base03}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "keyword" = {
            "color" = "${self.theme.base0E}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "label" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "link_text" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = "normal";
            "font_weight" = null;
          };
          "link_uri" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "namespace" = {
            "color" = "${self.theme.base0A}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "number" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "operator" = {
            "color" = "${self.theme.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "predictive" = {
            "color" = "${self.theme.base03}ff";
            "font_style" = "italic";
            "font_weight" = null;
          };
          "preproc" = {
            "color" = "${self.theme.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "primary" = {
            "color" = "${self.theme.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "property" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation" = {
            "color" = "${self.theme.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.bracket" = {
            "color" = "${self.theme.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.delimiter" = {
            "color" = "${self.theme.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.list_marker" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.markup" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.special" = {
            "color" = "${self.theme.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "selector" = {
            "color" = "${self.theme.base0E}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "selector.pseudo" = {
            "color" = "${self.theme.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string" = {
            "color" = "${self.theme.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.escape" = {
            "color" = "${self.theme.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.regex" = {
            "color" = "${self.theme.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special" = {
            "color" = "${self.theme.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special.symbol" = {
            "color" = "${self.theme.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "tag" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "text.literal" = {
            "color" = "${self.theme.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "title" = {
            "color" = "${self.theme.base0D}ff";
            "font_style" = null;
            "font_weight" = 700;
          };
          "type" = {
            "color" = "${self.theme.base0A}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variable" = {
            "color" = "${self.theme.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variable.special" = {
            "color" = "${self.theme.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variant" = {
            "color" = "${self.theme.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
        };
      };
    }
  ];
}

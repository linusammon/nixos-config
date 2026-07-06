config: with config.theme; {
  "$schema" = "https://zed.dev/schema/themes/v0.2.0.json";
  name = "base16";
  author = "";
  themes = [
    {
      "name" = "Base16";
      "appearance" = "dark";
      "style" = {
        "border" = "${colors.base00}ff";
        "border.variant" = "${colors.base00}ff";
        "border.focused" = "${colors.base00}ff";
        "border.selected" = "${colors.base00}ff";
        "border.transparent" = "#00000000";
        "border.disabled" = "${colors.base03}ff";
        "elevated_surface.background" = "${colors.base01}ff";
        "surface.background" = "${colors.base00}ff";
        "background" = "${colors.base00}ff";
        "element.background" = "${colors.base01}ff";
        "element.hover" = "${colors.base02}ff";
        "element.active" = "${colors.base02}ff";
        "element.selected" = "${colors.base02}ff";
        "element.disabled" = "${colors.base01}ff";
        "drop_target.background" = "${colors.base03}80";
        "ghost_element.background" = "#00000000";
        "ghost_element.hover" = "${colors.base02}ff";
        "ghost_element.active" = "${colors.base02}ff";
        "ghost_element.selected" = "${colors.base02}ff";
        "ghost_element.disabled" = "${colors.base01}ff";
        "text" = "${colors.base05}ff";
        "text.muted" = "${colors.base04}ff";
        "text.placeholder" = "${colors.base03}ff";
        "text.disabled" = "${colors.base03}ff";
        "text.accent" = "${colors.base0D}ff";
        "icon" = "${colors.base05}ff";
        "icon.muted" = "${colors.base04}ff";
        "icon.disabled" = "${colors.base03}ff";
        "icon.placeholder" = "${colors.base04}ff";
        "icon.accent" = "${colors.base0D}ff";
        "status_bar.background" = "${colors.base00}ff";
        "title_bar.background" = "${colors.base00}ff";
        "title_bar.inactive_background" = "${colors.base00}ff";
        "toolbar.background" = "${colors.base00}ff";
        "tab_bar.background" = "${colors.base00}ff";
        "tab.inactive_background" = "${colors.base00}ff";
        "tab.active_background" = "${colors.base00}ff";
        "search.match_background" = "${colors.base0A}66";
        "search.active_match_background" = "${colors.base09}66";
        "panel.background" = "${colors.base00}ff";
        "panel.focused_border" = null;
        "pane.focused_border" = null;
        "scrollbar.thumb.background" = "${colors.base04}4c";
        "scrollbar.thumb.hover_background" = "${colors.base02}ff";
        "scrollbar.thumb.border" = "${colors.base02}ff";
        "scrollbar.track.background" = "#00000000";
        "scrollbar.track.border" = "${colors.base01}ff";
        "editor.foreground" = "${colors.base05}ff";
        "editor.background" = "${colors.base00}ff";
        "editor.gutter.background" = "${colors.base00}ff";
        "editor.subheader.background" = "${colors.base01}ff";
        "editor.active_line.background" = "${colors.base01}80";
        "editor.highlighted_line.background" = "${colors.base01}ff";
        "editor.line_number" = "${colors.base03}ff";
        "editor.active_line_number" = "${colors.base05}ff";
        "editor.hover_line_number" = "${colors.base04}ff";
        "editor.invisible" = "${colors.base03}ff";
        "editor.wrap_guide" = "${colors.base02}0d";
        "editor.active_wrap_guide" = "${colors.base02}1a";
        "editor.document_highlight.read_background" = "${colors.base0D}1a";
        "editor.document_highlight.write_background" = "${colors.base02}66";
        "terminal.background" = "${colors.base00}ff";
        "terminal.foreground" = "${colors.base05}ff";
        "terminal.bright_foreground" = "${colors.base07}ff";
        "terminal.dim_foreground" = "${colors.base03}ff";
        "terminal.ansi.black" = "${colors.base00}ff";
        "terminal.ansi.bright_black" = "${colors.base03}ff";
        "terminal.ansi.dim_black" = "${colors.base00}ff";
        "terminal.ansi.red" = "${colors.base08}ff";
        "terminal.ansi.bright_red" = "${colors.base08}ff";
        "terminal.ansi.dim_red" = "${colors.base08}bf";
        "terminal.ansi.green" = "${colors.base0B}ff";
        "terminal.ansi.bright_green" = "${colors.base0B}ff";
        "terminal.ansi.dim_green" = "${colors.base0B}bf";
        "terminal.ansi.yellow" = "${colors.base0A}ff";
        "terminal.ansi.bright_yellow" = "${colors.base0A}ff";
        "terminal.ansi.dim_yellow" = "${colors.base0A}bf";
        "terminal.ansi.blue" = "${colors.base0D}ff";
        "terminal.ansi.bright_blue" = "${colors.base0D}ff";
        "terminal.ansi.dim_blue" = "${colors.base0D}bf";
        "terminal.ansi.magenta" = "${colors.base0E}ff";
        "terminal.ansi.bright_magenta" = "${colors.base0E}ff";
        "terminal.ansi.dim_magenta" = "${colors.base0E}bf";
        "terminal.ansi.cyan" = "${colors.base0C}ff";
        "terminal.ansi.bright_cyan" = "${colors.base0C}ff";
        "terminal.ansi.dim_cyan" = "${colors.base0C}bf";
        "terminal.ansi.white" = "${colors.base05}ff";
        "terminal.ansi.bright_white" = "${colors.base07}ff";
        "terminal.ansi.dim_white" = "${colors.base04}ff";
        "link_text.hover" = "${colors.base0D}ff";
        "version_control.added" = "${colors.base0B}ff";
        "version_control.modified" = "${colors.base0A}ff";
        "version_control.word_added" = "${colors.base0B}59";
        "version_control.word_deleted" = "${colors.base08}cc";
        "version_control.deleted" = "${colors.base08}ff";
        "version_control.conflict_marker.ours" = "${colors.base0B}1a";
        "version_control.conflict_marker.theirs" = "${colors.base0D}1a";
        "conflict" = "${colors.base0A}ff";
        "conflict.background" = "${colors.base0A}1a";
        "conflict.border" = "${colors.base0A}80";
        "created" = "${colors.base0B}ff";
        "created.background" = "${colors.base0B}1a";
        "created.border" = "${colors.base0B}80";
        "deleted" = "${colors.base08}ff";
        "deleted.background" = "${colors.base08}1a";
        "deleted.border" = "${colors.base08}80";
        "error" = "${colors.base08}ff";
        "error.background" = "${colors.base08}1a";
        "error.border" = "${colors.base08}80";
        "hidden" = "${colors.base03}ff";
        "hidden.background" = "${colors.base02}1a";
        "hidden.border" = "${colors.base02}ff";
        "hint" = "${colors.base0C}ff";
        "hint.background" = "${colors.base0C}1a";
        "hint.border" = "${colors.base0C}80";
        "ignored" = "${colors.base03}ff";
        "ignored.background" = "${colors.base02}1a";
        "ignored.border" = "${colors.base02}ff";
        "info" = "${colors.base0D}ff";
        "info.background" = "${colors.base0D}1a";
        "info.border" = "${colors.base0D}80";
        "modified" = "${colors.base0A}ff";
        "modified.background" = "${colors.base0A}1a";
        "modified.border" = "${colors.base0A}80";
        "predictive" = "${colors.base03}ff";
        "predictive.background" = "${colors.base03}1a";
        "predictive.border" = "${colors.base03}80";
        "renamed" = "${colors.base0D}ff";
        "renamed.background" = "${colors.base0D}1a";
        "renamed.border" = "${colors.base0D}80";
        "success" = "${colors.base0B}ff";
        "success.background" = "${colors.base0B}1a";
        "success.border" = "${colors.base0B}80";
        "unreachable" = "${colors.base04}ff";
        "unreachable.background" = "${colors.base03}1a";
        "unreachable.border" = "${colors.base03}ff";
        "warning" = "${colors.base0A}ff";
        "warning.background" = "${colors.base0A}1a";
        "warning.border" = "${colors.base0A}80";
        "players" = [
          {
            "cursor" = "${colors.base0D}ff";
            "background" = "${colors.base0D}20";
            "selection" = "${colors.base0D}30";
          }
          {
            "cursor" = "${colors.base0E}ff";
            "background" = "${colors.base0E}20";
            "selection" = "${colors.base0E}30";
          }
          {
            "cursor" = "${colors.base08}ff";
            "background" = "${colors.base08}20";
            "selection" = "${colors.base08}30";
          }
          {
            "cursor" = "${colors.base09}ff";
            "background" = "${colors.base09}20";
            "selection" = "${colors.base09}30";
          }
          {
            "cursor" = "${colors.base0A}ff";
            "background" = "${colors.base0A}20";
            "selection" = "${colors.base0A}30";
          }
          {
            "cursor" = "${colors.base0B}ff";
            "background" = "${colors.base0B}20";
            "selection" = "${colors.base0B}30";
          }
          {
            "cursor" = "${colors.base0C}ff";
            "background" = "${colors.base0C}20";
            "selection" = "${colors.base0C}30";
          }
          {
            "cursor" = "${colors.base0F}ff";
            "background" = "${colors.base0F}20";
            "selection" = "${colors.base0F}30";
          }
        ];
        "syntax" = {
          "attribute" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "boolean" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "comment" = {
            "color" = "${colors.base03}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "comment.doc" = {
            "color" = "${colors.base04}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "constant" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "constructor" = {
            "color" = "${colors.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "embedded" = {
            "color" = "${colors.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "emphasis" = {
            "color" = "${colors.base0E}ff";
            "font_style" = "italic";
            "font_weight" = null;
          };
          "emphasis.strong" = {
            "color" = "${colors.base0A}ff";
            "font_style" = null;
            "font_weight" = 700;
          };
          "enum" = {
            "color" = "${colors.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "function" = {
            "color" = "${colors.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "hint" = {
            "color" = "${colors.base03}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "keyword" = {
            "color" = "${colors.base0E}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "label" = {
            "color" = "${colors.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "link_text" = {
            "color" = "${colors.base08}ff";
            "font_style" = "normal";
            "font_weight" = null;
          };
          "link_uri" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "namespace" = {
            "color" = "${colors.base0A}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "number" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "operator" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "predictive" = {
            "color" = "${colors.base03}ff";
            "font_style" = "italic";
            "font_weight" = null;
          };
          "preproc" = {
            "color" = "${colors.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "primary" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "property" = {
            "color" = "${colors.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.bracket" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.delimiter" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.list_marker" = {
            "color" = "${colors.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.markup" = {
            "color" = "${colors.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "punctuation.special" = {
            "color" = "${colors.base0F}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "selector" = {
            "color" = "${colors.base0E}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "selector.pseudo" = {
            "color" = "${colors.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string" = {
            "color" = "${colors.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.escape" = {
            "color" = "${colors.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.regex" = {
            "color" = "${colors.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special" = {
            "color" = "${colors.base0C}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "string.special.symbol" = {
            "color" = "${colors.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "tag" = {
            "color" = "${colors.base08}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "text.literal" = {
            "color" = "${colors.base0B}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "title" = {
            "color" = "${colors.base0D}ff";
            "font_style" = null;
            "font_weight" = 700;
          };
          "type" = {
            "color" = "${colors.base0A}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variable" = {
            "color" = "${colors.base05}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variable.special" = {
            "color" = "${colors.base09}ff";
            "font_style" = null;
            "font_weight" = null;
          };
          "variant" = {
            "color" = "${colors.base0D}ff";
            "font_style" = null;
            "font_weight" = null;
          };
        };
      };
    }
  ];
}

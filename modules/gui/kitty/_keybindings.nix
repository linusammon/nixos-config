let
  leader = "ctrl+space";
in
{
  "${leader}>v" = "launch --location=vsplit --cwd=current";
  "${leader}>s" = "launch --location=hsplit --cwd=current";
  "${leader}>c" = "launch --type=tab --cwd=current";
  "${leader}>x" = "close_window";
  "${leader}>shift+x" = "close_tab";
  "${leader}>z" = "toggle_layout stack";
  "${leader}>r" = "start_resizing_window";
  "${leader}>space" = "next_layout";
  "${leader}>[" = "show_scrollback";
  "${leader}>shift+r" = "load_config_file";

  "${leader}>h" = "neighboring_window left";
  "${leader}>j" = "neighboring_window down";
  "${leader}>k" = "neighboring_window up";
  "${leader}>l" = "neighboring_window right";


  "${leader}>n" = "next_tab";
  "${leader}>p" = "previous_tab";
  "${leader}>," = "set_tab_title";
  "${leader}>1" = "goto_tab 1";
  "${leader}>2" = "goto_tab 2";
  "${leader}>3" = "goto_tab 3";
  "${leader}>4" = "goto_tab 4";
  "${leader}>5" = "goto_tab 5";
  "${leader}>6" = "goto_tab 6";
  "${leader}>7" = "goto_tab 7";
  "${leader}>8" = "goto_tab 8";
  "${leader}>9" = "goto_tab 9";

  "${leader}>${leader}" = "send_text all \\x00";
}

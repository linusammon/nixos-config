{
  flake.modules.homeManager.helix = {
    programs.helix = {
      settings = {
        editor = {
          line-number = "relative";
          mouse = false;
        };

        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        keys = {
          insert = {
            up = "no_op";
            down = "no_op";
            right = "no_op";
            left = "no_op";
            pageup = "no_op";
            pagedown = "no_op";
            home = "no_op";
            end = "no_op";
          };

          normal = {
            up = "no_op";
            down = "no_op";
            right = "no_op";
            left = "no_op";
            pageup = "no_op";
            pagedown = "no_op";
            home = "no_op";
            end = "no_op";
            space = {
              space = [
                ":sh rm -f /tmp/unique-file"
                ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
                ":insert-output echo '\x1b[?1049h\x1b[?2004h' > /dev/tty"
                ":open %sh{cat /tmp/unique-file}"
                ":redraw"
              ];
            };
          };
        };
      };
    };
  };
}

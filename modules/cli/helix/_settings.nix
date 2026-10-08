{ pkgs, lib, ... }: {
  theme = "base16_transparent";

  editor = {
    mouse = false;
    completion-timeout = 5;
    completion-trigger-len = 1;
    line-number = "relative";
    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    indent-guides = {
      render = true;
      character = "▏";
      skip-levels = 0;
    };
    end-of-line-diagnostics = "hint";
    lsp = {
      display-inlay-hints = true;
      display-color-swatches = true;
    };
    true-color = true;
  };

  keys.normal."C-g" = [
    ":write-all"
    ":insert-output env -u XDG_CONFIG_HOME ${lib.getExe pkgs.lazygit} >/dev/tty"
    ":redraw"
    ":reload-all"
  ];
}

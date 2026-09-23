{
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
  };
}

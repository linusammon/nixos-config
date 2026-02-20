{
  flake.modules.homeManager.helix =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        nil
        nixd
      ];

      programs.helix = {
        enable = true;
        defaultEditor = true;

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
            };
          };
        };

        languages = {
          language = [
            {
              name = "nix";
              auto-format = true;
              formatter.command = "nix fmt";
            }
          ];
        };
      };
    };
}

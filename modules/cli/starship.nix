{
  modules.nixos.cli.starship =
    { pkgs, lib, ... }:
    let
      toml = pkgs.formats.toml { };
      conf = toml.generate "starship.toml" {
        add_newline = false;
        line_break = {
          disabled = true;
        };
      };
    in
    {
      programs.fish.promptInit = ''
        if test "$TERM" != dumb
          set -x STARSHIP_CONFIG ${conf}
          ${lib.getExe pkgs.starship} init fish | source
        end
      '';
    };
}

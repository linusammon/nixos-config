{
  flake.modules.nixos.starship =
    { pkgs, lib, ... }:
    let
      toml = pkgs.formats.toml { };
      conf = toml.generate "starship.toml" {
        add_newline = false;
        line_break = {
          disabled = true;
        };
      };
      exe = lib.getExe pkgs.starship;
    in
    {
      programs = {
        fish.promptInit = ''
          if test "$TERM" != dumb
            set -x STARSHIP_CONFIG ${conf}
            ${exe} init fish | source
          end
        '';
      };
    };
}

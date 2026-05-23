{
  self,
  inputs,
  ...
}:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages.noctalia = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
        runtimePkgs = [ pkgs.gpu-screen-recorder ];
        env.NOCTALIA_CONFIG_HOME = "${placeholder "out"}/";
        constructFiles = {
          settings = {
            relPath = "noctalia/config.toml";
            content = builtins.toJSON (import ./_settings.nix { inherit self; });
            builder = "${lib.getExe pkgs.remarshal} -f json -i \"$1\" -t toml -o \"$2\"";
          };
          pallete = {
            relPath = "noctalia/palettes/palette.json";
            content = builtins.toJSON (import ./_palette.nix { inherit self; });
          };
        };
      };
    };

  flake.modules.nixos.programs_noctalia =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      exe = lib.getExe pkg;
    in
    {
      environment.systemPackages = [ pkg ];

      hj.systemd.services.noctalia = {
        partOf = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        environment.PATH = lib.mkForce null;
        restartTriggers = [ pkg ];
        serviceConfig = {
          ExecStart = exe;
          Restart = "on-failure";
        };
      };

      custom.keybinds = {
        "Mod+Space".spawn = [
          exe
          "msg"
          "panel-toggle"
          "launcher"
        ];
        "Mod+Escape".spawn = [
          exe
          "msg"
          "panel-toggle"
          "session"
        ];
      };
    };
}

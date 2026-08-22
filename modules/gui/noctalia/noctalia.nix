{
  self,
  inputs,
  lib,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    noctalia = inputs.nix-wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.noctalia.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          ./patches/0001-bar-add-click-through-option.patch
        ];
      });
      env.NOCTALIA_CONFIG_HOME = "${placeholder "out"}/";
      constructFiles = {
        settings = {
          relPath = "noctalia/config.toml";
          content = builtins.toJSON (import ./_settings.nix { inherit (self.theme) fonts; });
          builder = "${lib.getExe pkgs.remarshal} -f json -i \"$1\" -t toml -o \"$2\"";
        };
        pallete = {
          relPath = "noctalia/palettes/palette.json";
          content = builtins.toJSON (import ./_palette.nix { inherit (self.theme) colors; });
        };
      };
    };
  });

  modules.nixos.gui.noctalia =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      exe = lib.getExe pkg;
    in
    {
      environment.systemPackages = [ pkg ];

      security.polkit = {
        enable = true;
        enablePkexecWrapper = true;
      };

      systemd.user.services.noctalia = {
        partOf = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        wantedBy = [ "graphical-session.target" ];
        restartTriggers = [ pkg ];
        environment.PATH = lib.mkForce null;
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
        "Mod+S".spawn = [
          exe
          "msg"
          "screenshot-region"
        ];
        "Mod+Shift+S".spawn = [
          exe
          "msg"
          "screenshot-fullscreen"
        ];
      };
    };
}

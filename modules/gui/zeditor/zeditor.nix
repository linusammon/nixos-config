{
  self,
  inputs,
  lib,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    zeditor = inputs.nix-wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.zed-editor;
      env.XDG_CONFIG_HOME = "${placeholder "out"}/";
      constructFiles = {
        keymap = {
          relPath = "zed/keymap.json";
          content = builtins.toJSON (import ./_keymap.nix);
        };
        settings = {
          relPath = "zed/settings.json";
          content = builtins.toJSON (
            lib.recursiveUpdate (import ./_settings.nix { inherit (self.theme) fonts; }) (
              import ./_langs.nix { inherit pkgs lib; }
            )
          );
        };
        theme = {
          relPath = "zed/themes/base16.json";
          content = builtins.toJSON (import ./_theme.nix { inherit (self.theme) colors; });
        };
      };
    };
  });

  modules.nixos.gui.zeditor =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.zeditor;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Shift+E".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".cache/zed"
        ".local/share/zed"
      ];
    };
}

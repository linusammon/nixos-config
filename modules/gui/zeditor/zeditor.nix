{
  inputs,
  config,
  lib,
  ...
}:
{
  packages.zeditor =
    pkgs:
    inputs.nix-wrapper-modules.lib.wrapPackage {
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
            lib.recursiveUpdate (import ./_settings.nix config) (import ./_langs.nix pkgs lib)
          );
        };
        theme = {
          relPath = "zed/themes/base16.json";
          content = builtins.toJSON (import ./_theme.nix config);
        };
      };
    };

  modules.nixos.gui.zeditor =
    { pkgs, lib, ... }:
    let
      pkg = config.packages.zeditor pkgs;
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

{
  inputs,
  config,
  lib,
  ...
}:
let
  dir = ./langs;

  allLangs = lib.listToAttrs (
    map (n: {
      name = lib.removeSuffix ".nix" (lib.removePrefix "_" n);
      value = dir + "/${n}";
    }) (builtins.filter (n: lib.hasSuffix ".nix" n) (builtins.attrNames (builtins.readDir dir)))
  );

  loadLangs =
    pkgs:
    builtins.foldl' (
      acc: name: lib.recursiveUpdate acc (import allLangs.${name} { inherit pkgs lib; })
    ) { };

  mkPkg =
    langs:
    { pkgs, ... }:
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
            lib.recursiveUpdate (import ./_settings.nix config) (loadLangs pkgs langs)
          );
        };
        theme = {
          relPath = "zed/themes/base16.json";
          content = builtins.toJSON (import ./_theme.nix config);
        };
      };
    };
in
{
  packages = lib.mapAttrs (_: mkPkg) (
    {
      zeditor = [ "nix" ];
      zeditor-full = builtins.attrNames allLangs;
      zeditor-minimal = [ ];
    }
    // lib.mapAttrs (name: _: [ name ]) allLangs
  );

  modules.nixos.gui.zeditor =
    { pkgs, lib, ... }:
    let
      pkg = config.packages.zeditor { inherit pkgs; };
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

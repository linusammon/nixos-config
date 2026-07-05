{
  inputs,
  config,
  lib,
  ...
}:
let
  dir = ./langs;

  allLangs =
    dir
    |> builtins.readDir
    |> builtins.attrNames
    |> builtins.filter (n: lib.hasSuffix ".nix" n)
    |> map (n: {
      name = n |> lib.removePrefix "_" |> lib.removeSuffix ".nix";
      value = dir + "/${n}";
    })
    |> lib.listToAttrs;

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
      zeditor = [ ];
      zeditor-full = builtins.attrNames allLangs;
    }
    // lib.mapAttrs' (name: _: lib.nameValuePair "zeditor-${name}" [ name ]) allLangs
  );

  modules.nixos.gui.zeditor =
    { pkgs, lib, ... }:
    let
      pkg = config.packages.zeditor-nix { inherit pkgs; };
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

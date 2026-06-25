{
  modules.nixos.gui.zeditor =
    {
      theme,
      pkgs,
      lib,
      ...
    }:
    let
      pkg = pkgs.zed-editor;
    in
    {
      environment.systemPackages = [ pkg ];

      hj.xdg.config.files = {
        "zed/settings.json".text = builtins.toJSON (
          (import ./_settings.nix theme) // (import ./_languages.nix { inherit lib pkgs; })
        );
        "zed/themes/base16.json".text = builtins.toJSON (import ./_theme.nix theme);
      };

      custom.keybinds."Mod+Shift+E".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".cache/zed"
        ".local/share/zed"
      ];
    };
}

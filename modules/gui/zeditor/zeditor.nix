{
  modules.nixos.gui.zeditor =
    {
      pkgs,
      lib,
      theme,
      args,
      ...
    }:
    let
      pkg = pkgs.zed-editor;
    in
    {
      environment.systemPackages = [ pkg ];

      hj.xdg.config.files =
        let
          settings = import ./_settings.nix theme;
          languages = import ./_languages.nix {
            inherit lib pkgs;
            inherit (args) hostName;
          };
        in
        {
          "zed/settings.json".text = builtins.toJSON (lib.recursiveUpdate settings languages);
          "zed/keymap.json".text = builtins.toJSON (import ./_keymap.nix);
          "zed/themes/base16.json".text = builtins.toJSON (import ./_theme.nix theme);
        };

      custom.keybinds."Mod+Shift+E".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".cache/zed"
        ".local/share/zed"
      ];
    };
}

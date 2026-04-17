{ self, ... }: {
  flake.modules.nixos.zeditor =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        pkgs.zed-editor
      ];

      hj.xdg.config.files = {
        "zed/settings.json".text = builtins.toJSON (import ./_settings.nix);
        "zed/themes/base16.json".text = builtins.toJSON (import ./_theme.nix { inherit self; });
      };
    };
}

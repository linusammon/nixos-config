{
  inputs,
  config,
  ...
}:
{
  packages.qutebrowser =
    pkgs:
    inputs.nix-wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.qutebrowser;
      constructFiles.config = {
        relPath = "qutebrowser/config.py";
        content = import ./_config.nix config.theme;
      };
      flags."--config-py" = "${placeholder "out"}/qutebrowser/config.py";
    };

  modules.nixos.gui.qutebrowser =
    { pkgs, lib, ... }:
    let
      pkg = config.packages.qutebrowser pkgs;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Shift+B".spawn = lib.getExe pkg;

      custom.persist.user.directories = [
        ".config/qutebrowser"
        ".cache/qutebrowser"
        ".local/share/qutebrowser"
      ];
    };
}

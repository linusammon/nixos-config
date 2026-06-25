{ inputs, config, ... }:
{

  packages.kitty =
    pkgs:
    inputs.nix-wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = import ./_settings.nix config;
    };

  modules.nixos.gui.kitty =
    { pkgs, lib, ... }:
    let
      pkg = config.packages.kitty pkgs;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Return".spawn = lib.getExe pkg;
    };
}

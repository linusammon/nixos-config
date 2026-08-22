{ self, inputs, ... }:
{
  packages = self.lib.perSystem (pkgs: {
    kitty = inputs.nix-wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = import ./_settings.nix { inherit (self.theme) colors; };
    };
  });

  modules.nixos.gui.kitty =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.kitty;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Return".spawn = lib.getExe pkg;
    };
}

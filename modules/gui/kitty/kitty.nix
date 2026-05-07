{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.kitty = inputs.wrappers.wrappers.kitty.wrap {
        inherit pkgs;
        settings = import ./_settings.nix { inherit self; };
      };
    };

  flake.modules.nixos.programs_kitty =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.kitty;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.keybinds."Mod+Return".spawn = lib.getExe pkg;
    };
}

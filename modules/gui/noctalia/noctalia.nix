{
  self,
  inputs,
  ...
}:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.noctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
        settings = import ./_settings.nix;
        colors = import ./_colors.nix { inherit self; };
      };
    };

  flake.modules.nixos.programs_noctalia =
    { pkgs, lib, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      exe = lib.getExe pkg;
    in
    {
      environment.systemPackages = [ pkg ];

      custom.autostart = [ exe ];

      custom.keybinds = {
        "Mod+Escape".spawn = [
          exe
          "ipc"
          "call"
          "sessionMenu"
          "toggle"
        ];
        "Mod+Space".spawn = [
          exe
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];
      };

      custom.persist.user.directories = [
        ".cache/noctalia"
      ];
    };
}

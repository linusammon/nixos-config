{
  self,
  inputs,
  lib,
  ...
}:
{
  packages = self.lib.perSystem (pkgs: {
    helix =
      let
        files = lib.filesystem.listFilesRecursive ./steel;
        relOf = f: lib.removePrefix "./" (lib.path.removePrefix ./steel f);
      in
      inputs.nix-wrapper-modules.wrappers.helix.wrap {
        inherit pkgs;
        package = pkgs.steelix;
        settings = import ./_settings.nix { inherit pkgs lib; };
        languages = import ./_languages.nix { inherit pkgs lib; };
        constructFiles = lib.listToAttrs (
          map (f: {
            name = "cog_${relOf f}";
            value = {
              relPath = "hx-config/helix/${relOf f}";
              content = builtins.readFile f;
            };
          }) files
        );
      };
  });

  modules.nixos.cli.helix =
    { pkgs, ... }:
    let
      pkg = self.packages.${pkgs.stdenv.hostPlatform.system}.helix;
      exe = lib.getExe pkg;
    in
    {
      environment.systemPackages = [ pkg ];

      environment.sessionVariables = {
        EDITOR = exe;
        VISUAL = exe;
      };
    };
}

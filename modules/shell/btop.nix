{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      conf = pkgs.writeText "btop.conf" ''
        theme_background = false
        rounded_corners = false
        cpu_single_graph = true
        clock_format = ""
      '';
    in
    {
      packages.btop = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.btop.overrideAttrs (origAttrs: {
          postInstall = ''
            ${origAttrs.postInstall or ""}
            rm -rf $out/share/applications/*.desktop
          '';
        });
        flags = {
          "--config" = conf;
        };
      };
    };

  flake.modules.nixos.common =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.btop
      ];
    };
}

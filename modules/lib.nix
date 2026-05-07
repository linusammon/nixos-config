{ inputs, self, ... }:
{
  flake.lib = {
    mkNixos =
      host:
      {
        user ? "linus",
        system ? "x86_64-linux",
        extraConfig ? { },
      }:
      {
        ${host} = inputs.nixpkgs.lib.nixosSystem {
          modules = [
            { config.custom.constants = { inherit user system host; }; }
            self.modules.nixos."host_${host}"
            self.modules.nixos.common
            extraConfig
          ];
        };
      };

    stripDesktopFiles =
      pkg:
      pkg.overrideAttrs (origAttrs: {
        postInstall = ''
          ${origAttrs.postInstall or ""}
          rm -rf $out/share/applications/*.desktop
        '';
      });
  };
}

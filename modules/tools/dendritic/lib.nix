{
  inputs,
  self,
  lib,
  ...
}:
{
  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = { };
  };

  config.flake.lib = {
    mkNixos =
      {
        hostName,
        system ? "x86_64-linux",
      }:
      {
        ${hostName} = inputs.nixpkgs.lib.nixosSystem {
          modules = [
            self.modules.nixos.${hostName}
            {
              networking.hostName = "${hostName}";
              nixpkgs.hostPlatform = lib.mkDefault "${system}";
            }
          ];
        };
      };

    mkHomeManager =
      { username }:
      {
        ${username} = inputs.home-manager.lib.homeManagerConfiguration {
          modules = [ inputs.self.modules.homeManager.${username} ];
        };
      };
  };
}

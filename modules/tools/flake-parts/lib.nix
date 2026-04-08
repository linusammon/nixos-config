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
        name,
        system ? "x86_64-linux",
        timeZone ? "Europe/Zurich",
      }:
      {
        ${name} = inputs.nixpkgs.lib.nixosSystem {
          modules = [
            self.modules.nixos.${name}
            {
              nixpkgs.hostPlatform = lib.mkDefault system;
              networking.hostName = name;
              time.timeZone = timeZone;
            }
          ];
        };
      };
  };
}

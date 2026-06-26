{ config, lib, ... }: {
  config.lib = {
    mkNixos =
      host:
      {
        user ? "linus",
        system ? "x86_64-linux",
        extraConfig ? { },
      }:
      {
        ${host} = lib.nixosSystem {
          specialArgs = {
            inherit host user system;
            inherit (config) theme;
          };
          modules = [
            {
              options.custom = lib.mkOption {
                type = lib.types.submodule { freeformType = lib.types.unspecified; };
              };
            }
            config.modules.nixos.hosts.${host}
            extraConfig
          ];
        };
      };

    collect =
      subtree:
      {
        exclude ? [ ],
      }:
      let
        collectLeaves =
          value:
          if value ? imports then
            [ value ]
          else
            lib.concatMap (name: collectLeaves value.${name}) (builtins.attrNames (removeAttrs value exclude));
      in
      {
        imports = collectLeaves subtree;
      };
  };
}

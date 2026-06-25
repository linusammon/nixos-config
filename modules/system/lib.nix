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
        getModuleFile =
          value:
          if value ? imports && builtins.isList value.imports && value.imports != [ ] then
            (builtins.head value.imports)._file or null
          else
            null;

        excludedFiles = builtins.filter (v: v != null) (map getModuleFile exclude);

        collectLeaves =
          value:
          if builtins.isFunction value then
            [ value ]
          else if builtins.isAttrs value then
            if value ? imports then
              let
                f = getModuleFile value;
              in
              if f != null && builtins.elem f excludedFiles then [ ] else [ value ]
            else
              lib.flatten (lib.attrValues (lib.mapAttrs (_: collectLeaves) value))
          else if builtins.isList value then
            lib.flatten (map collectLeaves value)
          else
            [ ];
      in
      {
        imports = collectLeaves subtree;
      };
  };
}

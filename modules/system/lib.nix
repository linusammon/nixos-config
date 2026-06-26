{
  inputs,
  config,
  lib,
  ...
}:
{
  config.lib = {
    mkNixos =
      hostName:
      {
        hostPlatform ? "x86_64-linux",
        timeZone ? "Europe/Zurich",
        keyMap ? "de",
        user ? "linus",
        modules ? [ ],
      }:
      {
        ${hostName} = lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit (config) theme;
            args = {
              inherit
                hostName
                hostPlatform
                timeZone
                keyMap
                user
                ;
            };
          };
          modules = [ ./_custom.nix ] ++ modules;
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

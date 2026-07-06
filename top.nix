{ lib, ... }:
let
  inherit (lib)
    mkOptionType
    mkOption
    mergeDefinitions
    ;

  recursive = mkOptionType {
    name = "recursive";
    check = v: lib.isFunction v || lib.isAttrs v;
    merge =
      loc: defs:
      if lib.all (d: lib.isFunction d.value) defs then
        lib.types.deferredModule.merge loc defs
      else
        let
          expanded = lib.concatMap (
            d:
            lib.mapAttrsToList (key: val: {
              inherit (d) file;
              name = key;
              value = val;
            }) d.value
          ) (lib.filter (d: lib.isAttrs d.value) defs);

          byKey = lib.groupBy (d: d.name) expanded;

          mergeKey =
            key: keyDefs:
            let
              keyDefsClean = map (d: {
                inherit (d) file;
                inherit (d) value;
              }) keyDefs;
            in
            (mergeDefinitions (loc ++ [ key ]) recursive keyDefsClean).mergedValue;
        in
        lib.mapAttrs mergeKey byKey;
  };
in
{
  options = with lib.types; {
    modules = mkOption { type = recursive; };
    theme = mkOption { type = lazyAttrsOf unspecified; };
    lib = mkOption { type = lazyAttrsOf unspecified; };
    nixosConfigurations = mkOption { type = lazyAttrsOf unspecified; };
    packages = mkOption { type = lazyAttrsOf (functionTo package); };
    formatter = mkOption { type = functionTo package; };
  };
}

{ lib, ... }:
let
  inherit (lib)
    mkOptionType
    mkOption
    mergeDefinitions
    ;
  inherit (builtins)
    isFunction
    isAttrs
    partition
    concatStringsSep
    foldl'
    attrNames
    listToAttrs
    ;

  recursive = mkOptionType {
    name = "recursive";
    check = v: isFunction v || isAttrs v;
    merge =
      loc: defs:
      let
        inherit (partition (d: isFunction d.value) defs) right wrong;
      in
      if right != [ ] && wrong != [ ] then
        throw "recursive: cannot mix leaves and branches at ${concatStringsSep "." loc}"
      else if wrong == [ ] then
        lib.types.deferredModule.merge loc defs
      else
        let
          defsByKey = foldl' (
            acc: d:
            foldl' (
              acc': key:
              acc'
              // {
                ${key} = (acc'.${key} or [ ]) ++ [
                  {
                    inherit (d) file;
                    value = d.value.${key};
                  }
                ];
              }
            ) acc (attrNames d.value)
          ) { } wrong;
        in
        listToAttrs (
          map (key: {
            name = key;
            value = (mergeDefinitions (loc ++ [ key ]) recursive defsByKey.${key}).mergedValue;
          }) (attrNames defsByKey)
        );
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

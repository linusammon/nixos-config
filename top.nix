{ lib, ... }:
let
  inherit (lib) mkOption types;

  recursive = with types; (lazyAttrsOf (either recursive deferredModule)) // { description = ""; };
in
{
  options = with types; {
    modules = mkOption { type = recursive; };
    theme = mkOption { type = lazyAttrsOf anything; };
    lib = mkOption { type = lazyAttrsOf (functionTo raw); };
    nixosConfigurations = mkOption { type = lazyAttrsOf raw; };
    packages = mkOption { type = lazyAttrsOf (functionTo package); };
    formatter = mkOption { type = functionTo package; };
  };
}

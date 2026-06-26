{ lib, ... }: {
  options.custom = lib.mkOption {
    type = lib.types.submodule { freeformType = lib.types.unspecified; };
  };
}

{
  flake.modules.nixos.wm =
    { lib, ... }:
    {
      options.custom.autostart = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ];
      };
    };
}

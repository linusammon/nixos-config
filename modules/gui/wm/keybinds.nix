{
  flake.modules.nixos.wm =
    { lib, ... }:
    {
      # TODO: Create an abstraction layer for keybinds that can be interpreted differently depending on the compositor.
      options.custom.keybinds = lib.mkOption {
        type = lib.types.attrsOf lib.types.anything;
        default = { };
      };
    };
}

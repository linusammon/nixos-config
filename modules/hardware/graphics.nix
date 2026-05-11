{
  flake.modules.nixos.hardware_graphics = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}

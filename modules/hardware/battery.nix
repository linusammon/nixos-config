{
  flake.modules.nixos.hardware_battery = {
    services = {
      upower.enable = true;
      tuned.enable = true;
    };
  };
}

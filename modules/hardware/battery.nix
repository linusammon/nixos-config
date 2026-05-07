{
  flake.modules.nixos.hardware_battery = {
    services = {
      upower.enable = true;
      power-profiles-daemon.enable = true;
    };
  };
}

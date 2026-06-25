{
  modules.nixos.hardware.power = _: {
    services = {
      upower.enable = true;
      power-profiles-daemon.enable = true;
    };
  };
}

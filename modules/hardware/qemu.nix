{
  modules.nixos.hardware.qemu = _: {
    services.qemuGuest.enable = true;
  };
}

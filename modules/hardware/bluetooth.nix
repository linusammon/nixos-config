{
  flake.modules.nixos.hardware_bluetooth = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    custom.persist.root.directories = [
      "/var/lib/bluetooth"
    ];
  };
}

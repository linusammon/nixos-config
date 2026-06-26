{ config, ... }: {
  nixosConfigurations = config.lib.mkNixos "zenbook" { };

  modules.nixos.hosts.zenbook = _: {
    imports =
      with config.modules.nixos;
      with config.lib;
      [
        (collect gui { exclude = [ "steam" ]; })
        (collect cli { })
        (collect system { })

        hardware.usb
        hardware.thunderbolt
        hardware.disk.nvme
        hardware.cpu.intel
        hardware.gpu.intel
        hardware.firmware
        hardware.networking
        hardware.bluetooth
        hardware.power
        hardware.zsa
      ];
  };
}

{ config, ... }: {
  nixosConfigurations = config.lib.mkNixos "riptide" { };

  modules.nixos.hosts.riptide = _: {
    imports =
      with config.modules.nixos;
      with config.lib;
      [
        (collect gui { })
        (collect cli { })
        (collect system { })

        hardware.usb
        hardware.disk.nvme
        hardware.disk.sata
        hardware.cpu.intel
        hardware.gpu.amd
        hardware.firmware
        hardware.networking
        hardware.zsa
      ];
  };
}

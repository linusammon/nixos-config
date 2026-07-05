{ config, ... }: {
  nixosConfigurations = config.lib.mkNixos "forgejo" {
    modules =
      with config.modules.nixos;
      with config.lib;
      [
        (collect cli { })
        (collect system {
          exclude = [ "impermanence" ];
        })
        (collect services.forgejo { })

        hardware.virtio
        hardware.qemu

        ./_disko.nix
      ];
  };
}

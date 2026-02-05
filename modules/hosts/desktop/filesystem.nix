{
  flake.modules.nixos.desktop = {
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/fcb94f80-c1b4-4864-b914-85b73207181e";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/04D5-8B4B";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/0ca24b57-75d4-47cd-8962-5dd69ae6057b"; } ];
  };
}

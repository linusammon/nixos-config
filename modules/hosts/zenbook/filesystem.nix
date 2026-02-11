{
  flake.modules.nixos.zenbook = {
    fileSystems = {
      "/" = {
        device = "/dev/disk/by-uuid/e7ea8e81-9b8f-45c8-af87-a997c5eb1405";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/E0B7-04BD";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/cefc054b-7ba5-4597-9c33-52f97ce0dde7"; } ];
  };
}

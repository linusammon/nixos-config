{
  config.flake.factory.disko =
    {
      device,
      swap,
    }:
    {
      disko.devices = {
        disk = {
          main = {
            type = "disk";
            inherit device;
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  priority = 1;
                  name = "ESP";
                  start = "1M";
                  end = "512M";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = {
                      "/root" = {
                        mountpoint = "/";
                        mountOptions = [
                          "subvol=root"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/nix" = {
                        mountOptions = [
                          "subvol=nix"
                          "compress=zstd"
                          "noatime"
                        ];
                        mountpoint = "/nix";
                      };
                      "/persistent" = {
                        mountpoint = "/persistent";
                        mountOptions = [
                          "subvol=persistent"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/var/log" = {
                        mountpoint = "/var/log";
                        mountOptions = [
                          "subvol=log"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/var/lib" = {
                        mountpoint = "/var/lib";
                        mountOptions = [
                          "subvol=lib"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/etc" = {
                        mountpoint = "/etc";
                        mountOptions = [
                          "subvol=log"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                      "/swap" = {
                        mountpoint = "/swap";
                        mountOptions = [
                          "subvol=swap"
                          "noatime"
                          "nodatacow"
                          "compress=no"
                        ];
                        swap.swapfile.size = swap;
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };

      fileSystems."/persistent".neededForBoot = true;
      fileSystems."/var/log".neededForBoot = true;
      fileSystems."/var/lib".neededForBoot = true;
      fileSystems."/etc".neededForBoot = true;
    };
}

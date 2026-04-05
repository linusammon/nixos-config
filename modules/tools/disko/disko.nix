{ inputs, lib, ... }:
{
  config.flake.lib.mkDisko =
    {
      device,
      swap ? null,
    }:
    {
      imports = [
        inputs.disko.nixosModules.disko
      ];

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
                          "subvol=etc"
                          "compress=zstd"
                          "noatime"
                        ];
                      };
                    }
                    // lib.optionalAttrs (swap != null) {
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

      fileSystems = lib.genAttrs [ "/persistent" "/var/log" "/var/lib" "/etc" ] (_path: {
        neededForBoot = true;
      });
    };
}

{ inputs, ... }:
{
  config.flake.factory.disko =
    {
      device,
      hostId,
      swap ? null,
    }:
    let
      swapDataset =
        if swap != null then
          {
            "local/swap" = {
              type = "zfs_volume";
              size = swap;
              content = {
                type = "swap";
                resumeDevice = true;
              };
              options = {
                volblocksize = "4096";
                compression = "zle";
                logbias = "throughput";
                sync = "always";
                primarycache = "metadata";
                secondarycache = "none";
                "com.sun:auto-snapshot" = "false";
              };
            };
          }
        else
          { };
    in
    {
      imports = [
        inputs.disko.nixosModules.disko
      ];

      # TODO: Look into a better way of doing this
      fileSystems."/home".neededForBoot = true;

      networking = { inherit hostId; };

      disko.devices = {
        disk.main = {
          inherit device;
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              zfs = {
                size = "100%";
                content = {
                  type = "zfs";
                  pool = "zroot";
                };
              };
            };
          };
        };

        zpool.zroot = {
          type = "zpool";
          rootFsOptions = {
            # https://wiki.archlinux.org/title/Install_Arch_Linux_on_ZFS
            acltype = "posixacl";
            atime = "off";
            compression = "zstd";
            mountpoint = "none";
            xattr = "sa";
          };
          options.ashift = "12";

          datasets = {
            "local" = {
              type = "zfs_fs";
              options.mountpoint = "none";
            };
            "local/home" = {
              type = "zfs_fs";
              mountpoint = "/home";
              # Used by services.zfs.autoSnapshot options.
              options."com.sun:auto-snapshot" = "true";
            };
            "local/nix" = {
              type = "zfs_fs";
              mountpoint = "/nix";
              options."com.sun:auto-snapshot" = "false";
            };
            "local/persist" = {
              type = "zfs_fs";
              mountpoint = "/persist";
              options."com.sun:auto-snapshot" = "false";
            };
            "local/root" = {
              type = "zfs_fs";
              mountpoint = "/";
              options."com.sun:auto-snapshot" = "false";
              postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^zroot/local/root@blank$' || zfs snapshot zroot/local/root@blank && zfs hold nixos-impermanence zroot/local/root@blank";
            };
          }
          // swapDataset;
        };
      };
    };
}

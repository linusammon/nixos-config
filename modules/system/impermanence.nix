{ inputs, ... }:
{
  modules.nixos.system.impermanence =
    {
      config,
      lib,
      args,
      ...
    }:
    let
      cfg = config.custom.persist;
    in
    {
      imports = [
        inputs.impermanence.nixosModules.impermanence
      ];

      options.custom.persist =
        let
          inherit (lib) types mkOption;
          inherit (types) listOf str;
        in
        {
          root = {
            directories = mkOption {
              type = listOf str;
              default = [ ];
            };
            files = mkOption {
              type = listOf str;
              default = [ ];
            };
          };
          user = {
            directories = mkOption {
              type = listOf str;
              default = [ ];
            };
            files = mkOption {
              type = listOf str;
              default = [ ];
            };
          };
        };

      config = {
        environment.persistence = {
          "/persist/root" = {
            directories = [
              "/var"
              "/etc"
            ]
            ++ cfg.root.directories;
            inherit (cfg.root) files;
          };

          "/persist/user".users.${args.user} = {
            inherit (cfg.user) directories;
            inherit (cfg.user) files;
          };
        };

        boot.initrd.systemd.services.btrfs-root-rotate = {
          wantedBy = [ "initrd.target" ];
          after = [ "systemd-cryptsetup@cryptroot.service" ];
          before = [ "sysroot.mount" ];
          unitConfig.DefaultDependencies = "no";
          serviceConfig.Type = "oneshot";
          script = ''
            mkdir -p /btrfs_tmp
            mount -o subvol=/ /dev/mapper/cryptroot /btrfs_tmp
            if [[ -e /btrfs_tmp/root ]]; then
              mkdir -p /btrfs_tmp/old_roots
              timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%d_%H:%M:%S")
              mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
            fi

            delete_subvolume_recursively() {
              IFS=$'\n'
              for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
                delete_subvolume_recursively "/btrfs_tmp/$i"
              done
              btrfs subvolume delete "$1"
            }

            for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
              delete_subvolume_recursively "$i"
            done

            btrfs subvolume create /btrfs_tmp/root
            umount /btrfs_tmp
          '';
        };
      };
    };
}

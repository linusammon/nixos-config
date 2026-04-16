{ inputs, ... }:
{
  flake.modules.nixos.impermanence =
    { lib, config, ... }:
    let
      cfg = config.persistence;
    in
    {
      imports = [
        inputs.impermanence.nixosModules.impermanence
      ];

      options.persistence = {
        directories = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };

        files = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };

        user = {
          name = lib.mkOption {
            type = lib.types.str;
            default = "linus";
          };

          directories = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
          };

          files = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
          };
        };
      };

      config = {
        environment.persistence = {
          "/persistent/user".users."${cfg.user.name}" = {
            inherit (cfg.user) directories;
            inherit (cfg.user) files;
          };

          "/persistent/system" = {
            inherit (cfg) directories;
            inherit (cfg) files;
          };
        };

        boot.initrd.postResumeCommands = lib.mkAfter ''
          mkdir /btrfs_tmp
            mount /dev/nvme0n1p2 /btrfs_tmp
            if [[ -e /btrfs_tmp/root ]]; then
              mkdir -p /btrfs_tmp/old_roots
              timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
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
}

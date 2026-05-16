{ inputs, ... }:
{
  flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
      (
        { pkgs, lib, ... }:
        {
          environment.systemPackages = with pkgs; [
            (writeShellApplication {
              name = "install";
              runtimeInputs = [ gum ];
              text = ''
                set -euo pipefail

                DISK=$(lsblk -dno NAME,SIZE,MODEL | \
                    gum filter \
                      --header "Select disk:" \
                      --height 10 \
                      --padding 1 | \
                    awk '{print $1}')

                HOST=$(gum choose desktop zenbook \
                    --header "Select configuration:" \
                    --padding 1)

                PASSWORD=$(gum input \
                    --header "$(gum style --foreground 99 "Install $HOST to /dev/$DISK?")" \
                    --placeholder "Enter password..." \
                    --password \
                    --padding 1)

                echo "$PASSWORD" | sudo -S -v 2>/dev/null || {
                    gum log --level error "Wrong password!"
                    exit 1
                }

                sudo nix run github:nix-community/disko/latest#disko-install -- \
                  --write-efi-boot-entries \
                  --flake "github:linusammon/nixos-config#$HOST" \
                  --disk main "/dev/$DISK"
              '';
            })
          ];

          programs.command-not-found.enable = lib.mkForce false;

          nix.settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];

            extra-substituters = [
              "https://linusammon.cachix.org"
            ];

            extra-trusted-public-keys = [
              "linusammon.cachix.org-1:g0X9oaHIZ5j48dsqfu8ZEdAp6HA2pH7Buv5Ye698qfc="
            ];
          };
        }
      )
    ];
  };
}

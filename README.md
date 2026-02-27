![nixos-config](https://socialify.git.ci/linusammon/nixos-config/image?description=1&font=Jost&language=1&logo=https%3A%2F%2Fraw.githubusercontent.com%2FNixOS%2Fnixos-artwork%2F9d2cdedd73d64a068214482902adea3d02783ba8%2Flogo%2Fnix-snowflake-colours.svg&name=1&owner=1&pattern=Transparent&theme=Auto)

## Installation

Boot from NixOS USB, then:

Find your target disk with `lsblk`. Available hosts are in `modules/hosts/`.

```bash
sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest#disko-install -- --write-efi-boot-entries --flake github:linusammon/nixos-config#your-host --disk main /dev/your-disk
```

Reboot when done.

> [!IMPORTANT]  
> Default passwords for ALL users (including root) are `changeme`. <br>
> Log in and change them <ins>immediately</ins> after first boot using `passwd`.

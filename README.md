![nixos-config](https://socialify.git.ci/linusammon/nixos-config/image?description=1&font=Jost&language=1&logo=https%3A%2F%2Fraw.githubusercontent.com%2FNixOS%2Fnixos-artwork%2F9d2cdedd73d64a068214482902adea3d02783ba8%2Flogo%2Fnix-snowflake-colours.svg&name=1&owner=1&pattern=Transparent&theme=Auto)


sudo nix --extra-experimental-features "nix-command flakes" run 'github:nix-community/disko/latest#disko-install' -- --write-efi-boot-entries --flake /path/to/your/flake#your-hostname --disk main /dev/your-disk
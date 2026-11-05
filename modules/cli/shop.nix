{ inputs, ... }: {
  modules.nixos.cli.shop = { pkgs, ... }: {
    environment = {
      systemPackages = [
        inputs.nix-shop.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      shellAliases = {
        "," = "shop";
        ",," = "shop -s";
      };
    };
  };
}

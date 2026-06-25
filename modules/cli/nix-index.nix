{ inputs, ... }: {
  modules.nixos.cli.nix-index = { lib, ... }: {
    imports = [ inputs.nix-index-database.nixosModules.default ];

    programs = {
      nix-index-database.comma.enable = true;
      command-not-found.enable = lib.mkForce false;
    };
  };
}

{ inputs, ... }:
{
  flake.modules.nixos.hjem = {
    imports = [
      inputs.hjem.nixosModules.default
      (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" "linus" ])
    ];

    config.hjem.clobberByDefault = true;
    config.hjem.users.linus.systemd.enable = false;
  };
}

{ inputs, ... }:
{
  modules.nixos.system.hjem = { user, ... }: {
    imports = [
      inputs.hjem.nixosModules.default
      (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" user ])
    ];

    config.hjem.clobberByDefault = true;
  };
}

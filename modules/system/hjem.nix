{ inputs, ... }:
{
  modules.nixos.system.hjem = { args, ... }: {
    imports = [
      inputs.hjem.nixosModules.default
      (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" args.user ])
    ];

    config.hjem.clobberByDefault = true;
  };
}

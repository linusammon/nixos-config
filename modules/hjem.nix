{ inputs, ... }:
{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      imports = [
        inputs.hjem.nixosModules.default
        (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj" ] [ "hjem" "users" user ])
      ];

      config.hjem.clobberByDefault = true;
    };
}

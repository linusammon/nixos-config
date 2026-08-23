{ inputs, ... }:
{
  modules.nixos.hardware.wsl =
    { args, ... }:
    {
      imports = [ inputs.nixos-wsl.nixosModules.default ];

      wsl = {
        enable = true;
        defaultUser = args.user;
      };

      security.sudo.wheelNeedsPassword = true;
    };
}

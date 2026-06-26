{
  modules.nixos.system.users = { config, args, ... }: {
    users.users = {
      root.hashedPasswordFile = config.sops.secrets.user-password.path;

      ${args.user} = {
        hashedPasswordFile = config.sops.secrets.user-password.path;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };
  };
}

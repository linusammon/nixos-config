{
  modules.nixos.system.users = { config, user, ... }: {
    users.users = {
      root.hashedPasswordFile = config.sops.secrets.user-password.path;

      ${user} = {
        hashedPasswordFile = config.sops.secrets.user-password.path;
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };
  };
}

{
  modules.nixos.system.users = { config, args, ... }: {
    users = {
      mutableUsers = false;

      users =
        let
          hashedPasswordFile = config.sops.secrets.user-password.path;
        in
        {
          root = { inherit hashedPasswordFile; };

          ${args.user} = {
            inherit hashedPasswordFile;
            isNormalUser = true;
            extraGroups = [ "wheel" ];
          };
        };
    };
  };
}

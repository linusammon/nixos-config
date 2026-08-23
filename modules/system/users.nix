{
  modules.nixos.system.users = { config, args, ... }: {
    users = {
      mutableUsers = false;

      users =
        let
          hashedPasswordFile = config.security.nix-secrets.secrets."${args.scope}/password".path;
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

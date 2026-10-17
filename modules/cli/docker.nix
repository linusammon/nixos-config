{
  modules.nixos.cli.docker = { args, ... }: {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    users.users.${args.user}.extraGroups = [ "docker" ];
  };
}

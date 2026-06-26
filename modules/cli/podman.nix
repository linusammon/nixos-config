{
  modules.nixos.cli.podman = { args, ... }: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    users.users.${args.user}.extraGroups = [ "podman" ];
  };
}

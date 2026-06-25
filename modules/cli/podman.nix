{
  modules.nixos.cli.podman = { user, ... }: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    users.users.${user}.extraGroups = [ "podman" ];
  };
}

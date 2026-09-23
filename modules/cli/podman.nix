{
  modules.nixos.cli.podman = { args, pkgs, ... }: {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    users.users.${args.user}.extraGroups = [ "podman" ];

    environment = {
      systemPackages = with pkgs; [ podman-compose ];
      sessionVariables.PODMAN_COMPOSE_WARNING_LOGS = "false";
    };
  };
}

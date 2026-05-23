{
  flake.modules.nixos.common =
    { config, ... }:
    let
      inherit (config.custom.constants) user;
    in
    {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
      };

      users.users.${user}.extraGroups = [ "podman" ];

      custom.persist.root.directories = [
        "/var/lib/containers"
      ];
    };
}

{
  modules.nixos.hardware.networking = { user, ... }: {
    networking.networkmanager.enable = true;

    users.users.${user}.extraGroups = [ "networkmanager" ];
  };
}

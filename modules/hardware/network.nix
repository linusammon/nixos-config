{
  flake.modules.nixos.hardware_network = {
    networking.networkmanager.enable = true;

    custom.persist.root.directories = [
      "/etc/NetworkManager/system-connections"
    ];
  };
}

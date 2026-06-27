{
  modules.nixos.system.openssh = { args, ... }: {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    networking.firewall.allowedTCPPorts = [ 22 ];

    users.users =
      let
        keyFiles = [ ../../.id_ed25519.pub ];
      in
      {
        root.openssh.authorizedKeys.keyFiles = keyFiles;
        ${args.user}.openssh.authorizedKeys.keyFiles = keyFiles;
      };
  };
}

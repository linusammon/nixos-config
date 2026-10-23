{
  modules.nixos.system.ssh.client =
    { config, ... }:
    {
      programs = {
        ssh = {
          startAgent = true;
          extraConfig = ''
            Host *
            	IdentityFile ${config.security.nix-secrets.secrets."shared/ssh-key".path}
          '';
        };
        fish.interactiveShellInit = ''
          if not ssh-add -l >/dev/null 2>&1
            ssh-add ${config.security.nix-secrets.secrets."shared/ssh-key".path}
          end
        '';
      };
    };

  modules.nixos.system.ssh.server =
    { args, ... }:
    {
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

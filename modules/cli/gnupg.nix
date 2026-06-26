{
  modules.nixos.cli.gnupg =
    {
      config,
      pkgs,
      args,
      ...
    }:
    {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };

      systemd.services.import-gpg-key = {
        wantedBy = [ "multi-user.target" ];
        after = [ "local-fs.target" ];
        serviceConfig = {
          Type = "oneshot";
          User = args.user;
          RemainAfterExit = true;
        };
        script = ''
          if [ -f '${config.sops.secrets.gpg-private-key.path}' ]; then
            ${pkgs.gnupg}/bin/gpg --batch --import '${config.sops.secrets.gpg-private-key.path}'
          fi
        '';
      };

      custom.persist.user.directories = [
        ".gnupg"
      ];
    };
}

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

            KEYGRIP=$(${pkgs.gnupg}/bin/gpg --with-colons --with-keygrip --list-secret-keys 2>/dev/null | ${pkgs.gawk}/bin/awk -F: 'BEGIN{found=0} /^sec:/{sec=1} /^ssb:/{sec=0} /^cap:/{cap=$2} /^grp:/{if(sec==0 && cap~/a/ && found==0){print $10; found=1}}')
            if [ -n "$KEYGRIP" ]; then
              SSHCONTROL="$HOME/.gnupg/sshcontrol"
              mkdir -p "$HOME/.gnupg"
              if ! grep -q "$KEYGRIP" "$SSHCONTROL" 2>/dev/null; then
                echo "$KEYGRIP" >> "$SSHCONTROL"
              fi
            fi

            ${pkgs.gnupg}/bin/gpg-connect-agent reloadagent /bye 2>/dev/null || true
          fi
        '';
      };

      custom.persist.user.directories = [
        ".gnupg"
      ];
    };
}

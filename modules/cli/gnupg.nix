{
  modules.nixos.cli.gnupg =
    {
      config,
      pkgs,
      args,
      ...
    }:
    let
      gpgPrivateKeyPath = config.security.nix-secrets.secrets."${args.scope}/gpg-private-key".path;
    in
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
          if [ -f '${gpgPrivateKeyPath}' ]; then
            ${pkgs.gnupg}/bin/gpg --batch --import '${gpgPrivateKeyPath}'

            KEYGRIP=""
            for _ in $(seq 1 5); do
              KEYGRIP=$(${pkgs.gnupg}/bin/gpg --with-colons --with-keygrip --list-secret-keys 2>/dev/null | ${pkgs.gawk}/bin/awk -F: '/^(sec|ssb):/{auth=($12 ~ /a/)} /^grp:/{if(auth){print $10; exit}}')
              [ -n "$KEYGRIP" ] && break
              sleep 1
            done
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

{
  modules.nixos.cli.git =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      identities = [
        {
          host = "code.swisscom.com";
          email = "linus.ammon@swisscom.com";
        }
        {
          host = "gitlab.gibb.ch";
          email = "lam164830@stud.gibb.ch";
        }
      ];

      mkIdentityOverride =
        { host, email }:
        let
          identityFile = pkgs.writeText "git-identity" ''
            [user]
            	email = ${email}
          '';
        in
        {
          includeIf = {
            "hasconfig:remote.*.url:git@${host}:*/**".path = identityFile;
            "hasconfig:remote.*.url:https://${host}/**".path = identityFile;
          };
        };
    in
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        config = [
          {
            advice.skippedCherryPicks = false;
            branch.sort = "-committerdate";
            core.excludesFile =
              import ./_ignore.nix |> lib.concatStringsSep "\n" |> pkgs.writeText ".gitignore";
            core.fsmonitor = true;
            core.untrackedCache = true;
            diff.algorithm = "histogram";
            diff.colorMoved = "default";
            diff.renames = true;
            fetch.prune = true;
            help.autocorrect = 10;
            init.defaultBranch = "main";
            merge.conflictStyle = "diff3";
            protocol.version = 2;
            pull.rebase = true;
            push.autoSetupRemote = true;
            push.default = "simple";
            rebase.autoStash = true;
            rebase.updateRefs = true;
            rerere.enabled = true;
            user = {
              name = "Linus Ammon";
              email = "235536459+linusammon@users.noreply.github.com";
              signingkey = config.security.nix-secrets.secrets."shared/ssh-key".path;
            };
            gpg.format = "ssh";
            commit.gpgsign = true;
          }
        ]
        ++ map mkIdentityOverride identities;
      };

      environment.shellAliases = import ./_aliases.nix;
    };
}

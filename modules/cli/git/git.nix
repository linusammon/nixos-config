{
  modules.nixos.cli.git = { pkgs, lib, ... }: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      config = {
        advice.skippedCherryPicks = false;
        branch.sort = "-committerdate";
        commit.gpgSign = true;
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
        tag.gpgSign = true;
        url = {
          "git@github.com:".insteadOf = [
            "gh:"
            "github:"
            "https://github.com/"
          ];
          "git@gitlab.com:".insteadOf = [
            "gl:"
            "gitlab:"
            "https://gitlab.com/"
          ];
          "git@codeberg.org:".insteadOf = [
            "cb:"
            "codeberg:"
            "https://codeberg.org/"
          ];
        };
        user = {
          name = "Linus Ammon";
          email = "235536459+linusammon@users.noreply.github.com";
          signingkey = "8B9FFAA2F0A5C411";
        };
      };
    };

    environment.shellAliases = import ./_aliases.nix;
  };
}

{
  modules.nixos.cli.git =
    {
      pkgs,
      lib,
      ...
    }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        config = {
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
        };
      };

      environment.shellAliases = import ./_aliases.nix;
    };
}

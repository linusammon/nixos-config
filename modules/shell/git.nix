{
  flake.modules.nixos.common =
    { pkgs, lib, ... }:
    let
      gitignores = [
        ".idea/"
        "*.iml"
        "*.iws"
        "*.ipr"
        ".vscode/*"
        "*~"
        "#*#"
        ".#*"
        "*.swp"
        "*.swo"
        "*.swn"
        ".project"
        ".classpath"
        ".settings/"
      ];
    in
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        config = {
          advice.skippedCherryPicks = false;
          branch.sort = "-committerdate";
          commit.gpgSign = true;
          core.excludesFile = pkgs.writeText ".gitignore" (lib.concatStringsSep "\n" gitignores);
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
          url."git@github.com:".insteadOf = [
            "gh:"
            "https://github.com/"
          ];
          user.name = "Linus Ammon";
          user.email = "235536459+linusammon@users.noreply.github.com";
          user.signingkey = "8B9FFAA2F0A5C411";
        };
      };

      environment.shellAliases = {
        # base
        g = "git";
        gcl = "git clone --recurse-submodules";

        # status / log / show / blame / reflog
        gs = "git status";
        gss = "git status -s";
        glo = "git log --oneline --decorate";
        glog = "git log --oneline --decorate --graph";
        gloga = "git log --oneline --decorate --graph --all";
        gsh = "git show";
        gbl = "git blame -w";
        grl = "git reflog";

        # add / rm / clean
        ga = "git add";
        gaa = "git add --all";
        gap = "git add --patch";
        grm = "git rm";
        gclean = "git clean -id";

        # diff
        gd = "git diff";
        gds = "git diff --staged";

        # commit / fixup / undo / wip
        gc = "git commit -v";
        "gc!" = "git commit -v --amend";
        gca = "git commit -v -a";
        "gca!" = "git commit -v -a --amend";
        gcm = "git commit -v -m";
        "gcn!" = "git commit -v --no-edit --amend";
        gcf = "git commit -v --fixup";
        gundo = "git reset --soft HEAD~1";
        gwip = "git add -A && git commit --no-verify -m 'wip'";
        gwipe = "git add -A && git commit --no-verify -m 'wip' && git reset HEAD~1";

        # branch / tag
        gb = "git branch";
        gba = "git branch -a";
        gbd = "git branch -d";
        gbD = "git branch -D";
        gta = "git tag -a";

        # switch
        gsw = "git switch";
        "gsw-" = "git switch -";
        gswc = "git switch -c";

        # merge / rebase / cherry-pick / revert / range-diff
        gm = "git merge";
        grb = "git rebase";
        grbi = "git rebase -i";
        grf = "git rebase -i --autosquash";
        grba = "git rebase --abort";
        grbc = "git rebase --continue";
        grbs = "git rebase --skip";
        gcp = "git cherry-pick";
        grev = "git revert";
        grd = "git range-diff";

        # fetch / pull
        gf = "git fetch";
        gfa = "git fetch --all --prune";
        gl = "git pull";

        # push
        gp = "git push";
        gpd = "git push --dry-run";
        gpf = "git push --force-with-lease";
        "gpf!" = "git push --force";

        # remote
        gr = "git remote";
        gra = "git remote add";
        grr = "git remote remove";
        grv = "git remote -v";

        # reset / restore
        grh = "git reset";
        grhs = "git reset --soft";
        grhh = "git reset --hard";
        grs = "git restore";
        grst = "git restore --staged";

        # stash
        gsp = "git stash push";
        gsa = "git stash apply";
        gspo = "git stash pop";
        gsl = "git stash list";

        # worktree
        gwt = "git worktree";
        gwta = "git worktree add";
      };
    };
}

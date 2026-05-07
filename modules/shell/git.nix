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
          user = {
            name = "Linus Ammon";
            email = "235536459+linusammon@users.noreply.github.com";
          };
          url = {
            "git@github.com:".insteadOf = [
              "gh:"
              "https://github.com/"
            ];
            "git@gitlab.com:".insteadOf = [
              "gl:"
              "https://gitlab.com/"
            ];
            "git@codeberg.org:".insteadOf = [
              "cb:"
              "https://codeberg.org/"
            ];
          };
          rebase = {
            autoStash = true;
            updateRefs = true;
          };
          core.excludesFile = pkgs.writeText ".gitignore" (lib.concatStringsSep "\n" gitignores);
          init.defaultBranch = "main";
          diff.colorMoved = "default";
          pull.rebase = true;
          push.default = "simple";
        };
      };

      environment.shellAliases = {
        g = "git";
        gs = "git status";
        gl = "git log --oneline --graph --decorate";
        gla = "git log --oneline --graph --decorate --all";
        gd = "git diff";
        gds = "git diff --staged";
        ga = "git add";
        gaa = "git add --all";
        gc = "git commit";
        gcm = "git commit -m";
        gca = "git commit --amend";
        gcan = "git commit --amend --no-edit";
        gcf = "git commit --fixup";
        gcs = "git commit --squash";
        gb = "git branch";
        gba = "git branch -a";
        gbd = "git branch -d";
        gsw = "git switch";
        gswc = "git switch -c";
        gp = "git push";
        gpf = "git push --force-with-lease";
        gpl = "git pull";
        gf = "git fetch --all --prune";
        gst = "git stash";
        gstp = "git stash pop";
        gstl = "git stash list";
        grh = "git reset --hard";
        grm = "git reset --mixed";
        grs = "git reset --soft";
        gundo = "git reset --soft HEAD~1";
        grb = "git rebase -i";
        grbc = "git rebase --continue";
        grba = "git rebase --abort";
        gcp = "git cherry-pick";
        gwip = "git add -A && git commit -m 'wip'";
      };
    };
}

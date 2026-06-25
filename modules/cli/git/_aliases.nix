{
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
}

{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Linus Ammon";
          email = "235536459+linusammon@users.noreply.github.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}

{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Linus Ammon";
          email = "linus@example.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}

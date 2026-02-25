{
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings.init.defaultBranch = "main";
    };

    home.persistence."/persist".directories = [
      ".config/git"
    ];
  };
}

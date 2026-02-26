{
  flake.modules.homeManager.userdirs =
    { config, ... }:
    {
      xdg.userDirs =
        let
          home = "${config.home.homeDirectory}";
        in
        {
          createDirectories = true;

          desktop = "${home}/desktop";
          documents = "${home}/desktop/documents";
          pictures = "${home}/desktop/pictures";
          videos = "${home}/desktop/videos";
          music = "${home}/desktop/music";
          download = "${home}/downloads";

          extraConfig.XDG_PROJECTS_DIR = "${home}/projects";

          publicShare = null;
          templates = null;
        };

      home.persistence."/persist".directories = [
        "desktop"
        "downloads"
        "projects"
      ];
    };
}

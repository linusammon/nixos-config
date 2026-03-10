{
  flake.modules.homeManager.xdg =
    { config, ... }:
    {
      xdg = {
        enable = true;
        mimeApps.enable = true;

        userDirs =
          let
            home = "${config.home.homeDirectory}";
          in
          {
            createDirectories = true;

            desktop = "${home}/projects";
            documents = "${home}/documents";
            download = "${home}/downloads";
            pictures = "${home}/pictures";
            videos = "${home}/videos";

            music = null;
            publicShare = null;
            templates = null;
          };
      };

      home.persistence."/persistent".directories = [
        "projects"
        "documents"
        "downloads"
        "pictures"
        "videos"
      ];
    };
}

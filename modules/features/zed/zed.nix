{
  flake.modules.homeManager.zed = {
    programs.zed-editor.enable = true;

    home.persistence."/persistent".directories = [
      ".local/share/zed"
    ];
  };
}

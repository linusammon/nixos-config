{
  flake.modules.homeManager.fastfetch = {
    programs.fastfetch.enable = true;

    home.file.".config/fastfetch/config.jsonc".source = ./files/config.jsonc;
  };
}

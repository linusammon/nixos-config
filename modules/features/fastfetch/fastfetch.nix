{
  flake.modules.homeManager.fastfetch = {
    programs.fastfetch.enable = true;

    home.persistence."/persistent".directories = [
      ".config/fastfetch"
    ];
  };
}

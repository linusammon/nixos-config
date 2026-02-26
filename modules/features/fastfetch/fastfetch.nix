{
  flake.modules.homeManager.fastfetch = {
    programs.fastfetch.enable = true;

    home.persistence."/persist".directories = [
      ".config/fastfetch"
    ];
  };
}

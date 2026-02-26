{
  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -U fish_greeting
      '';
    };

    home.persistence."/persist".directories = [
      ".config/fish"
    ];
  };
}

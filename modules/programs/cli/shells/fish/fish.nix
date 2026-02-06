{
  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      shellAliases = {
        cd = "z";
      };
      interactiveShellInit = ''
        set -U fish_greeting
      '';
    };
  };
}

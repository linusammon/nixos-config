{
  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      shellAliases = {
        cd = "z";
        lt = "eza -T";
      };
      interactiveShellInit = ''
        set -U fish_greeting
      '';
    };
  };
}

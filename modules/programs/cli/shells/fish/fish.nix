{
  flake.modules.homeManager.fish = {
    programs.fish = {
      enable = true;
      shellAliases = {
        cd = "z";
        lt = "eza -T";
        clock = "tty-clock -D -c";
      };
      interactiveShellInit = ''
        set -U fish_greeting
      '';
    };
  };
}

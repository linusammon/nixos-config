{
  flake.modules.homeManager.clock =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tty-clock
      ];

      programs.fish.shellAliases = {
        clock = "tty-clock -D -c";
      };
    };
}

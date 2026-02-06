{
  flake.modules.homeManager.clock =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tty-clock
      ];
    };
}

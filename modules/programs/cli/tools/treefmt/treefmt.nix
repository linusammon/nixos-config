{
  flake.modules.homeManager.treefmt =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        treefmt
      ];
    };
}

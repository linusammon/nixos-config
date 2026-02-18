{
  flake.modules.homeManager.wget =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        wget2
      ];
    };
}

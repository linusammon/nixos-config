{
  flake.modules.homeManager.vlc =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        vlc
      ];
    };
}
